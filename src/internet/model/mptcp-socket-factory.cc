/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2016 University College London
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
 * Author: Lynne Salameh <l.salameh@cs.ucl.ac.uk>
 */
#include "mptcp-socket-factory.h"
#include "tcp-l4-protocol.h"
#include "ns3/socket.h"
#include "ns3/assert.h"
#include "tcp-congestion-ops.h"
#include "mptcp-lia.h"
#include "mptcp-olia.h"
#include "mptcp-meta-socket.h"

namespace ns3 {

NS_OBJECT_ENSURE_REGISTERED(MpTcpSocketFactory);
  
MpTcpSocketFactory::MpTcpSocketFactory ()
  : m_tcp (0)
{
}
MpTcpSocketFactory::~MpTcpSocketFactory ()
{
  NS_ASSERT (m_tcp == 0);
}

TypeId
MpTcpSocketFactory::GetTypeId (void)
{
  static TypeId tid = TypeId ("ns3::MpTcpSocketFactory")
                              .SetParent<SocketFactory> ()
                              .SetGroupName ("Internet")
							  .AddAttribute("MP_CC_algo",
									  "select a multipath congestion control algorithm",
									  UintegerValue (0),
									  MakeUintegerAccessor(&MpTcpSocketFactory::setMpCcAlgo,
											  &MpTcpSocketFactory::getMpCcAlgo),
											  MakeUintegerChecker<uint32_t> ())

  ;
return tid;
}

void
MpTcpSocketFactory::SetTcp (Ptr<TcpL4Protocol> tcp)
{
  m_tcp = tcp;
}

uint32_t MpTcpSocketFactory::getMpCcAlgo() const {
		return m_mp_cc_algo;
	}

	void MpTcpSocketFactory::setMpCcAlgo(uint32_t mpCcAlgo) {
		m_mp_cc_algo = mpCcAlgo;
	}

Ptr<Socket>
MpTcpSocketFactory::CreateSocket (void)
{
  if(getMpCcAlgo()==0){
	  std::cout<<"LIA!"<<endl;
	  return m_tcp->CreateSocket (MpTcpLia::GetTypeId (), MpTcpMetaSocket::GetTypeId());
  }else{
	  std::cout<<"OLIA!"<<endl;
	  return m_tcp->CreateSocket (MpTcpOLia::GetTypeId (), MpTcpMetaSocket::GetTypeId());
  }

}

void 
MpTcpSocketFactory::DoDispose (void)
{
  m_tcp = 0;
  SocketFactory::DoDispose ();
}

} // namespace ns3
