/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2015 University of Sussex
 * Copyright (c) 2015 Universit√© Pierre et Marie Curie (UPMC)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author:  Matthieu Coudron <matthieu.coudron@lip6.fr>
 *          Morteza Kheirkhah <m.kheirkhah@sussex.ac.uk>
 */

#include "ns3/log.h"
#include "mptcp-olia.h"
#include "mptcp-subflow.h"
#include "mptcp-meta-socket.h"

// #include "rl-data-interface.h"

NS_LOG_COMPONENT_DEFINE ("MpTcpOLia");

namespace ns3
{

NS_OBJECT_ENSURE_REGISTERED (MpTcpOLia);

TypeId
MpTcpOLia::GetTypeId (void)
{
  static TypeId tid = TypeId ("ns3::MpTcpOLia")
    .SetParent<TcpNewReno> ()
    .SetGroupName ("Internet")
    .AddConstructor<MpTcpOLia> ()
//    .AddTraceSource ("Alpha",
//                     "Value of the alp",
//                     MakeTraceSourceAccessor (&MpTcpLia::m_alpha),
//                     "ns3::WTH_IS_ZIS_TracedValueCallback"
//                     )
      ;
  ;
  return tid;
}

TypeId
MpTcpOLia::GetInstanceTypeId (void)
{
  return GetTypeId ();
}


// TODO we should aggregate CC for the mptcp case ?
MpTcpOLia::MpTcpOLia() : TcpNewReno()
                      , m_alpha (1)
{
  NS_LOG_FUNCTION_NOARGS();
}

MpTcpOLia::~MpTcpOLia ()
{
  NS_LOG_FUNCTION_NOARGS();
}


std::string
MpTcpOLia::GetName () const
{
  return "MpTcpOLia";
}

double
MpTcpOLia::ComputeFirstTerm (Ptr<MpTcpMetaSocket> metaSock, Ptr<TcpSocketState> tcb) const
{
  // this method is called whenever a congestion happen in order to regulate the agressivety of m_subflows
  // m_alpha = cwnd_total * MAX(cwnd_i / rtt_i^2) / {SUM(cwnd_i / rtt_i))^2}   //RFC 6356 formula (2)

  NS_LOG_FUNCTION(this);

  double firstTerm = 0;
  double ri = 0; // Matches the w_r/rtt_r^2 part
  double sumi = 0; // SUM(cwnd_i / rtt_i)


  NS_ASSERT (metaSock);
  // TODO here
  for (uint32_t i = 0; i < metaSock->GetNActiveSubflows(); i++)
    {

      Ptr<MpTcpSubflow> sFlow = metaSock->GetActiveSubflow(i);
//      NS_LOG_UNCOND("the tcb of this path r:"<<tcb<<" the tcb of i-th path"<<sFlow->GetTcb());
      Time time = sFlow->GetRttEstimator()->GetEstimate();
      double rtt = time.GetSeconds();
      double tmpi = tcb->m_cWnd.Get() / (rtt * rtt);

      if (tcb == sFlow->GetTcb())
        ri = tmpi;

      sumi += tcb->m_cWnd.Get() / rtt;
    }
  firstTerm =  ri / (sumi * sumi);
  return firstTerm;
}

double
MpTcpOLia::ComputeSecondTerm (Ptr<MpTcpMetaSocket> metaSock, Ptr<TcpSocketState> tcb) const
{
	NS_LOG_FUNCTION(this);
	double alpha_r=0;
//	CollectedPath=metaSock->GetCollectedPath()
	/*
	 *alpha_r is calculated as follows:
		- If r is in collected_paths, then
					1/number_of_paths
		alpha_r = --------------------
					|collected_paths|
	 * */
	for(uint32_t i = 0; i < uint32_t(metaSock->GetCollectedSubflows().size()); i++){
		Ptr<MpTcpSubflow> sFlow = metaSock->GetCollectedSubflows()[i];
		if(tcb == sFlow->GetTcb()){
			alpha_r=(1.0/metaSock->GetNActiveSubflows())/metaSock->GetCollectedSubflows().size();
		}
	}
	/*
	 * - If r is in max_w_paths and if collected_paths is not empty, then
					1/number_of_paths
		alpha_r = - -----------------
					|max_w_paths|
	 */
	if(uint32_t(metaSock->GetCollectedSubflows().size())>0){
		for(uint32_t i = 0; i < uint32_t(metaSock->GetMax_w_Subflows().size()); i++){
			Ptr<MpTcpSubflow> sFlow = metaSock->GetMax_w_Subflows()[i];
			if(tcb == sFlow->GetTcb()){
				alpha_r=-(1.0/metaSock->GetNActiveSubflows())/metaSock->GetMax_w_Subflows().size();
			}
		}

	}

	NS_LOG_UNCOND("the alpha:"<<alpha_r);

	return alpha_r/(double)tcb->m_cWnd;


}

void
MpTcpOLia::IncreaseWindow (Ptr<TcpSocketState> tcb, uint32_t segmentsAcked)
{
  NS_LOG_FUNCTION (this);

  // std::cout<< "Hong Jiaming: 1"<< endl;
  // static rl::InterfaceToRL rl_socket("127.0.0.1", 12345);
  // std::cout<< "Hong Jiaming: 2"<< endl;
  // static uint32_t seq_num = 0;
  // std::cout<< "Hong Jiaming: 3"<< endl;
  // rl_socket.add("ssn", seq_num);
  // std::cout<< "Hong Jiaming: 4"<< endl;
  // rl_socket.add("m_cWnd", tcb->m_cWnd);
  // rl_socket.add("m_ssThresh", tcb->m_ssThresh);
  // rl_socket.add("m_segmentSize", tcb->m_segmentSize);
  // Ptr<MpTcpMetaSocket> metaSock = DynamicCast<MpTcpMetaSocket>(tcb->m_socket);
  // rl_socket.add("totalCwnd", metaSock->GetTotalCwnd ());
  // rl_socket.add("m_alpha", ComputeAlpha (metaSock, tcb));
  // rl_socket.add("size", uint32_t(7));
  // std::cout<< "Hong Jiaming: 6"<< endl;
  // cout << rl_socket.get_send_str() << endl;
  // rl_socket.send();
  // std::cout<< "Hong Jiamindg: 7"<< endl;
  // std::string recv_str = rl_socket.recv();
  // std::cout<< recv_str << endl;
  // tcb->m_cWnd = std::stoi(recv_str);
  // seq_num++;

  // Increase of cwnd based on current phase (slow start or congestion avoidance)
  if (tcb->m_cWnd < tcb->m_ssThresh)
  {
    tcb->m_cWnd += tcb->m_segmentSize;
    NS_LOG_UNCOND("In SlowStart, updated tcb " << tcb << " cwnd to " << tcb->m_cWnd << " ssthresh " << tcb->m_ssThresh);
//    NS_LOG_INFO ("In SlowStart, updated tcb " << tcb << " cwnd to " << tcb->m_cWnd << " ssthresh " << tcb->m_ssThresh);
  }
  else
  {
	 NS_LOG_UNCOND("In CongAvoid,");
    Ptr<MpTcpMetaSocket> metaSock = DynamicCast<MpTcpMetaSocket>(tcb->m_socket);
    uint32_t totalCwnd = metaSock->GetTotalCwnd ();

    m_alpha = ComputeFirstTerm (metaSock, tcb);
//    double alpha_scale = 1;
//         The alpha_scale parameter denotes the precision we want for computing alpha
//                alpha  bytes_acked * MSS_i   bytes_acked * MSS_i
//          min ( --------------------------- , ------------------- )  (3)
//                 alpha_scale * cwnd_total              cwnd_i

  double adder = (ComputeFirstTerm(metaSock, tcb)+ComputeSecondTerm(metaSock, tcb))*tcb->m_segmentSize * tcb->m_segmentSize ;
//  static_cast<double>((tcb->m_segmentSize * tcb->m_segmentSize) / tcb->m_cWnd.Get ()));

  // Congestion avoidance mode, increase by (segSize*segSize)/cwnd. (RFC2581, sec.3.1)
    // To increase cwnd for one segSize per RTT, it should be (ackBytes*segSize)/cwnd

//    adder = std::max (1.0, adder);
    tcb->m_cWnd += static_cast<uint32_t> (adder);
    NS_LOG_INFO ("In CongAvoid, updated tcb " << tcb << " cwnd to " << tcb->m_cWnd << " ssthresh " << tcb->m_ssThresh);
  }
}

Ptr<TcpCongestionOps>
MpTcpOLia::Fork ()
{
  return CreateObject<MpTcpOLia>();
}

}
