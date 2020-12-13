/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2015 University of Sussex
 * Copyright (c) 2015 Université Pierre et Marie Curie (UPMC)
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
#include "mptcp-balia.h"
#include "mptcp-subflow.h"
#include "mptcp-meta-socket.h"

// #include "rl-data-interface.h"

NS_LOG_COMPONENT_DEFINE ("MpTcpBalia");

namespace ns3
{

NS_OBJECT_ENSURE_REGISTERED (MpTcpBalia);

TypeId
MpTcpBalia::GetTypeId (void)
{
  static TypeId tid = TypeId ("ns3::MpTcpBalia")
    .SetParent<TcpNewReno> ()
    .SetGroupName ("Internet")
    .AddConstructor<MpTcpBalia> ()
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
MpTcpBalia::GetInstanceTypeId (void)
{
  return GetTypeId ();
}


// TODO we should aggregate CC for the mptcp case ?
MpTcpBalia::MpTcpBalia() : TcpNewReno()
{
  NS_LOG_FUNCTION_NOARGS();
}

MpTcpBalia::~MpTcpBalia ()
{
  NS_LOG_FUNCTION_NOARGS();
}


std::string
MpTcpBalia::GetName () const
{
  return "MpTcpBalia";
}

double
MpTcpBalia::ComputeAlpha_r(Ptr<MpTcpMetaSocket> metaSock, Ptr<const TcpSocketState> tcb) const
{
  //alpha_r = max { x_k } / x_r
  NS_LOG_FUNCTION(this);

  double max_x_k = 0, x_r = 0;

  NS_ASSERT (metaSock);

  for (uint32_t k = 0; k < metaSock->GetNActiveSubflows(); k++)
    {
      Ptr<MpTcpSubflow> sFlow = metaSock->GetActiveSubflow(k);

      if (tcb == sFlow->GetTcb())
        {
          double rtt_r = sFlow->GetRttEstimator()->GetEstimate().GetSeconds();
          double w_r = tcb->m_cWnd.Get();
          x_r = w_r / rtt_r;
        }

      uint32_t w_k = sFlow->GetTcb()->m_cWnd.Get();
      double rtt_k = sFlow->GetRttEstimator()->GetEstimate().GetSeconds();
      double x_k = w_k / rtt_k;

      if (max_x_k < x_k)
        max_x_k = x_k;
    }

  double alpha_r = max_x_k / x_r;
  return alpha_r;
}

double
MpTcpBalia::ComputeIncreaseFactor(Ptr<MpTcpMetaSocket> metaSock, Ptr<TcpSocketState> tcb) const
{

//(x_r + max{x_k}) * (4 * x_r + max{x_k})
//---------------------------------------
//     w_r * (SUM(x_k))^2 * 10

  NS_LOG_FUNCTION(this);

  double x_r = 0, max_x_k = 0, sum_x_k = 0;
  uint32_t w_r = tcb->m_cWnd.Get();

  NS_ASSERT (metaSock);

  for (uint32_t k = 0; k < metaSock->GetNActiveSubflows(); k++)
    {
      Ptr<MpTcpSubflow> sFlow = metaSock->GetActiveSubflow(k);

      if (tcb == sFlow->GetTcb())
        {
          double rtt_r = sFlow->GetRttEstimator()->GetEstimate().GetSeconds();
          x_r = w_r / rtt_r;
        }

      uint32_t w_k = sFlow->GetTcb()->m_cWnd.Get();
      double rtt_k = sFlow->GetRttEstimator()->GetEstimate().GetSeconds();
      double x_k = w_k / rtt_k;

      if (max_x_k < x_k)
        max_x_k = x_k;

      sum_x_k += x_k;
    }

  return (x_r + max_x_k) * (4 * x_r + max_x_k) / (w_r * sum_x_k * sum_x_k * 10);

}

void
MpTcpBalia::IncreaseWindow (Ptr<TcpSocketState> tcb, uint32_t segmentsAcked)
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


    double adder = ComputeIncreaseFactor(metaSock, tcb) * tcb->m_segmentSize * tcb->m_segmentSize;

    tcb->m_cWnd += static_cast<uint32_t> (adder);
    NS_LOG_INFO ("In CongAvoid, updated tcb " << tcb << " cwnd to " << tcb->m_cWnd << " ssthresh " << tcb->m_ssThresh);
  }
}
uint32_t
MpTcpBalia::GetSsThresh (Ptr<const TcpSocketState> tcb, uint32_t bytesInFlight)
{
  NS_LOG_FUNCTION (this << tcb << bytesInFlight);

  Ptr<MpTcpMetaSocket> metaSock = DynamicCast<MpTcpMetaSocket>(tcb->m_socket);

  return std::max (2.0 * tcb->m_segmentSize, bytesInFlight * (1.0 - std::min(ComputeAlpha_r(metaSock, tcb), 1.5) / 2.0));

}

Ptr<TcpCongestionOps>
MpTcpBalia::Fork ()
{
  return CreateObject<MpTcpBalia>();
}

}
