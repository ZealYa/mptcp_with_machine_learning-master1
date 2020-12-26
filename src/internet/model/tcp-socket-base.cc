/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2007 Georgia Tech Research Corporation
 * Copyright (c) 2010 Adrian Sai-wah Tam
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
 * Author: Adrian Sai-wah Tam <adrian.sw.tam@gmail.com>
 */

#define NS_LOG_APPEND_CONTEXT \
  if (m_node) { std::clog << " [node " << m_node->GetId () << "] "; }

#include "ns3/abort.h"
#include "ns3/node.h"
#include "ns3/inet-socket-address.h"
#include "ns3/inet6-socket-address.h"
#include "ns3/log.h"
#include "ns3/ipv4.h"
#include "ns3/ipv6.h"
#include "ns3/ipv4-interface-address.h"
#include "ns3/ipv4-route.h"
#include "ns3/ipv6-route.h"
#include "ns3/ipv4-routing-protocol.h"
#include "ns3/ipv6-routing-protocol.h"
#include "ns3/simulation-singleton.h"
#include "ns3/simulator.h"
#include "ns3/packet.h"
#include "ns3/uinteger.h"
#include "ns3/double.h"
#include "ns3/pointer.h"
#include "ns3/trace-source-accessor.h"
#include "tcp-socket-base.h"
#include "tcp-l4-protocol.h"
#include "ipv4-end-point.h"
#include "ipv6-end-point.h"
#include "ipv6-l3-protocol.h"
#include "tcp-header.h"
#include "tcp-option-winscale.h"
#include "tcp-option-ts.h"
#include "rtt-estimator.h"
#include "tcp-congestion-ops.h"
#include "tcp-option-mptcp.h"

/////////////*********
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/ipv4-static-routing-helper.h"
/////////////*********

#include <math.h>
#include <algorithm>

namespace ns3 {

NS_LOG_COMPONENT_DEFINE ("TcpSocketBase");

NS_OBJECT_ENSURE_REGISTERED (TcpSocketBase);

TypeId
TcpSocketBase::GetTypeId (void)
{
  static TypeId tid = TypeId ("ns3::TcpSocketBase")
    .SetParent<TcpSocketImpl> ()
    .SetGroupName ("Internet")
    .AddConstructor<TcpSocketBase> ()
//    .AddAttribute ("TcpState", "State in TCP state machine",
//                   TypeId::ATTR_GET,
//                   EnumValue (CLOSED),
//                   MakeEnumAccessor (&TcpSocketBase::m_state),
//                   MakeEnumChecker (CLOSED, "Closed"))
    .AddAttribute ("IcmpCallback", "Callback invoked whenever an icmp error is received on this socket.",
                   CallbackValue (),
                   MakeCallbackAccessor (&TcpSocketBase::m_icmpCallback),
                   MakeCallbackChecker ())
    .AddAttribute ("IcmpCallback6", "Callback invoked whenever an icmpv6 error is received on this socket.",
                   CallbackValue (),
                   MakeCallbackAccessor (&TcpSocketBase::m_icmpCallback6),
                   MakeCallbackChecker ())
    .AddAttribute ("TxBuffer",
                   "TCP Tx buffer",
                   PointerValue (),
                   MakePointerAccessor (&TcpSocketBase::GetTxBuffer),
                   MakePointerChecker<TcpTxBuffer32> ())
    .AddAttribute ("RxBuffer",
                   "TCP Rx buffer",
                   PointerValue (),
                   MakePointerAccessor (&TcpSocketBase::GetRxBuffer),
                   MakePointerChecker<TcpRxBuffer32> ())
    .AddTraceSource ("RTO",
                     "Retransmission timeout",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_rto),
                     "ns3::Time::TracedValueCallback")
    .AddTraceSource ("RTT",
                     "Last RTT sample",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_lastRtt),
                     "ns3::Time::TracedValueCallback")
    .AddTraceSource ("NextTxSequence",
                     "Next sequence number to send (SND.NXT)",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_nextTxSequenceTrace),
                     "ns3::SequenceNumber32TracedValueCallback")
    .AddTraceSource ("HighestSequence",
                     "Highest sequence number ever sent in socket's life time",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_highTxMarkTrace),
                     "ns3::SequenceNumber32TracedValueCallback")
    .AddTraceSource ("State",
                     "TCP state",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_state),
                     "ns3::TcpStatesTracedValueCallback")
    .AddTraceSource ("CongState",
                     "TCP Congestion machine state",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_congStateTrace),
                     "ns3::TcpSocketState::TcpCongStatesTracedValueCallback")
    .AddTraceSource ("RWND",
                     "Remote side's flow control window",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_rWnd),
                     "ns3::TracedValueCallback::Uint32")
    .AddTraceSource ("BytesInFlight",
                     "Socket estimation of bytes in flight",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_bytesInFlight),
                     "ns3::TracedValueCallback::Uint32")
    .AddTraceSource ("HighestRxSequence",
                     "Highest sequence number received from peer",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_highRxMark),
                     "ns3::SequenceNumber32TracedValueCallback")
    .AddTraceSource ("HighestRxAck",
                     "Highest ack received from peer",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_highRxAckMark),
                     "ns3::SequenceNumber32TracedValueCallback")
    .AddTraceSource ("CongestionWindow",
                     "The TCP connection's congestion window",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_cWndTrace),
                     "ns3::TracedValueCallback::Uint32")
    .AddTraceSource ("SlowStartThreshold",
                     "TCP slow start threshold (bytes)",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_ssThTrace),
                     "ns3::TracedValueCallback::Uint32")
    .AddTraceSource ("Tx",
                     "Send tcp packet to IP protocol",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_txTrace),
                     "ns3::TcpSocketBase::TcpTxRxTracedCallback")
    .AddTraceSource ("Rx",
                     "Receive tcp packet from IP protocol",
                     MakeTraceSourceAccessor (&TcpSocketBase::m_rxTrace),
                     "ns3::TcpSocketBase::TcpTxRxTracedCallback")
  ;
  return tid;
}

TypeId
TcpSocketBase::GetInstanceTypeId () const
{
  return TcpSocketBase::GetTypeId ();
}

TcpSocketBase::TcpSocketBase (void)
  : TcpSocketImpl(),
    m_retxEvent (),
    m_lastAckEvent (),
    m_delAckEvent (),
    m_persistEvent (),
    m_timewaitEvent (),
    m_dupAckCount (0),
    m_delAckCount (0),
    m_synCount (0),
    m_dataRetrCount (0),
    m_rto (Seconds (0.0)),
    m_lastRtt (Seconds (0.0)),
    m_endPoint (0),
    m_endPoint6 (0),
    m_state (CLOSED),
    m_errno (ERROR_NOTERROR),
    m_connected (false),
    m_rWnd (0),
    m_highRxMark (0),
    m_highTxAck (0),
    m_highRxAckMark (0),
    m_bytesAckedNotProcessed (0),
    m_bytesInFlight (0),
    m_rcvWindShift (0),
    m_sndWindShift (0),
    m_timestampToEcho (0),
    m_sendPendingDataEvent (),
    // Set m_recover to the initial sequence number
    m_recover (0),
    m_retransOut (0),
    m_isFirstPartialAck (true)

{
  NS_LOG_FUNCTION (this);
  m_rxBuffer = CreateObject<TcpRxBuffer32> ();
  m_txBuffer = CreateObject<TcpTxBuffer32> ();
  m_tcb      = CreateObject<TcpSocketState> ();

  bool ok;

  ok = m_tcb->TraceConnectWithoutContext ("CongestionWindow",
                                          MakeCallback (&TcpSocketBase::UpdateCwnd, this));
  NS_ASSERT (ok == true);

  ok = m_tcb->TraceConnectWithoutContext ("SlowStartThreshold",
                                          MakeCallback (&TcpSocketBase::UpdateSsThresh, this));
  NS_ASSERT (ok == true);

  ok = m_tcb->TraceConnectWithoutContext ("CongState",
                                          MakeCallback (&TcpSocketBase::UpdateCongState, this));
  NS_ASSERT (ok == true);

  ok = m_tcb->TraceConnectWithoutContext ("HighestSequence",
                                          MakeCallback (&TcpSocketBase::UpdateHighTxMark, this));
  NS_ASSERT (ok == true);
  //std::cout << "Hong Jiaming 13: End of TcpSocketBase::TcpSocketBase (void)" << std::endl;
}

TcpSocketBase::TcpSocketBase (const TcpSocketBase& sock)
  : TcpSocketImpl (sock),
    //copy object::m_tid and socket::callbacks
    m_dupAckCount (sock.m_dupAckCount),
    m_delAckCount (0),
    m_synCount (sock.m_synCount),
    m_dataRetrCount (sock.m_dataRetrCount),
    m_rto (sock.m_rto),
    m_lastRtt (sock.m_lastRtt),
    m_endPoint (0),
    m_endPoint6 (0),
    m_state (sock.m_state),
    m_errno (sock.m_errno),
    m_connected (sock.m_connected),
    m_rWnd (sock.m_rWnd),
    m_highRxMark (sock.m_highRxMark),
    m_highRxAckMark (sock.m_highRxAckMark),
    m_bytesAckedNotProcessed (sock.m_bytesAckedNotProcessed),
    m_bytesInFlight (sock.m_bytesInFlight),
    m_rcvWindShift (sock.m_rcvWindShift),
    m_sndWindShift (sock.m_sndWindShift),
    m_timestampToEcho (sock.m_timestampToEcho),
    m_recover (sock.m_recover),
    m_retransOut (sock.m_retransOut),
    m_isFirstPartialAck (sock.m_isFirstPartialAck),
    m_txTrace (sock.m_txTrace),
    m_rxTrace (sock.m_rxTrace)
{
  NS_LOG_FUNCTION (this);
  NS_LOG_LOGIC ("Invoked the copy constructor");
  // Copy the rtt estimator if it is set
  if (sock.m_rtt)
    {
      m_rtt = sock.m_rtt->Copy ();
    }
  // Reset all callbacks to null
  Callback<void, Ptr< Socket > > vPS = MakeNullCallback<void, Ptr<Socket> > ();
  Callback<void, Ptr<Socket>, const Address &> vPSA = MakeNullCallback<void, Ptr<Socket>, const Address &> ();
  Callback<void, Ptr<Socket>, uint32_t> vPSUI = MakeNullCallback<void, Ptr<Socket>, uint32_t> ();
  SetConnectCallback (vPS, vPS);
  SetDataSentCallback (vPSUI);
  SetSendCallback (vPSUI);
  SetRecvCallback (vPS);
  m_txBuffer = CopyObject (sock.m_txBuffer);
  m_rxBuffer = CopyObject (sock.m_rxBuffer);
  m_tcb = CopyObject (sock.m_tcb);
  if (sock.m_congestionControl)
    {
      m_congestionControl = sock.m_congestionControl->Fork ();
    }

  bool ok;

  ok = m_tcb->TraceConnectWithoutContext ("CongestionWindow",
                                          MakeCallback (&TcpSocketBase::UpdateCwnd, this));
  NS_ASSERT (ok == true);

  ok = m_tcb->TraceConnectWithoutContext ("SlowStartThreshold",
                                          MakeCallback (&TcpSocketBase::UpdateSsThresh, this));
  NS_ASSERT (ok == true);

  ok = m_tcb->TraceConnectWithoutContext ("CongState",
                                          MakeCallback (&TcpSocketBase::UpdateCongState, this));
  NS_ASSERT (ok == true);

  ok = m_tcb->TraceConnectWithoutContext ("HighestSequence",
                                          MakeCallback (&TcpSocketBase::UpdateHighTxMark, this));
}

TcpSocketBase::~TcpSocketBase (void)
{
  NS_LOG_FUNCTION (this);
  m_node = 0;
  if (m_endPoint != 0)
    {
      NS_ASSERT (m_tcp != 0);
      /*
       * Upon Bind, an Ipv4Endpoint is allocated and set to m_endPoint, and
       * DestroyCallback is set to TcpSocketBase::Destroy. If we called
       * m_tcp->DeAllocate, it wil destroy its Ipv4EndpointDemux::DeAllocate,
       * which in turn destroys my m_endPoint, and in turn invokes
       * TcpSocketBase::Destroy to nullify m_node, m_endPoint, and m_tcp.
       */
      NS_ASSERT (m_endPoint != 0);
      m_tcp->DeAllocate (m_endPoint);
      NS_ASSERT (m_endPoint == 0);
    }
  if (m_endPoint6 != 0)
    {
      NS_ASSERT (m_tcp != 0);
      NS_ASSERT (m_endPoint6 != 0);
      m_tcp->DeAllocate (m_endPoint6);
      NS_ASSERT (m_endPoint6 == 0);
    }
  m_tcp = 0;
  CancelAllTimers ();
}


/* Inherit from Socket class: Returns error code */
enum Socket::SocketErrno
TcpSocketBase::GetErrno (void) const
{
  return m_errno;
}

/* Inherit from Socket class: Returns socket type, NS3_SOCK_STREAM */
Ipv4EndPoint* TcpSocketBase::GetEndpoint () const
{
  return m_endPoint;
}

Ipv6EndPoint* TcpSocketBase::GetEndpoint6 () const
{
  return m_endPoint6;
}


/* Inherit from Socket class: Bind socket to an end-point in TcpL4Protocol */
int
TcpSocketBase::Bind (void)
{
  NS_LOG_FUNCTION (this);
  m_endPoint = m_tcp->Allocate ();
  if (0 == m_endPoint)
    {
      m_errno = ERROR_ADDRNOTAVAIL;
      return -1;
    }

  m_tcp->AddSocket (this);

  return SetupCallback ();
}

int
TcpSocketBase::Bind6 (void)
{
  NS_LOG_FUNCTION (this);
  m_endPoint6 = m_tcp->Allocate6 ();
  if (0 == m_endPoint6)
    {
      m_errno = ERROR_ADDRNOTAVAIL;
      return -1;
    }

  m_tcp->AddSocket (this);

  return SetupCallback ();
}

/* Inherit from Socket class: Bind socket (with specific address) to an end-point in TcpL4Protocol */
int
TcpSocketBase::Bind (const Address &address)
{
  NS_LOG_FUNCTION (this << address);
  if (InetSocketAddress::IsMatchingType (address))
    {
      InetSocketAddress transport = InetSocketAddress::ConvertFrom (address);
      Ipv4Address ipv4 = transport.GetIpv4 ();
      uint16_t port = transport.GetPort ();
      SetIpTos (transport.GetTos ());
      if (ipv4 == Ipv4Address::GetAny () && port == 0)
        {
          m_endPoint = m_tcp->Allocate ();
        }
      else if (ipv4 == Ipv4Address::GetAny () && port != 0)
        {
          m_endPoint = m_tcp->Allocate (port);
        }
      else if (ipv4 != Ipv4Address::GetAny () && port == 0)
        {
          m_endPoint = m_tcp->Allocate (ipv4);
        }
      else if (ipv4 != Ipv4Address::GetAny () && port != 0)
        {
          m_endPoint = m_tcp->Allocate (ipv4, port);
        }
      if (0 == m_endPoint)
        {
          m_errno = port ? ERROR_ADDRINUSE : ERROR_ADDRNOTAVAIL;
          return -1;
        }
    }
  else if (Inet6SocketAddress::IsMatchingType (address))
    {
      Inet6SocketAddress transport = Inet6SocketAddress::ConvertFrom (address);
      Ipv6Address ipv6 = transport.GetIpv6 ();
      uint16_t port = transport.GetPort ();
      if (ipv6 == Ipv6Address::GetAny () && port == 0)
        {
          m_endPoint6 = m_tcp->Allocate6 ();
        }
      else if (ipv6 == Ipv6Address::GetAny () && port != 0)
        {
          m_endPoint6 = m_tcp->Allocate6 (port);
        }
      else if (ipv6 != Ipv6Address::GetAny () && port == 0)
        {
          m_endPoint6 = m_tcp->Allocate6 (ipv6);
        }
      else if (ipv6 != Ipv6Address::GetAny () && port != 0)
        {
          m_endPoint6 = m_tcp->Allocate6 (ipv6, port);
        }
      if (0 == m_endPoint6)
        {
          m_errno = port ? ERROR_ADDRINUSE : ERROR_ADDRNOTAVAIL;
          return -1;
        }
    }
  else
    {
      m_errno = ERROR_INVAL;
      return -1;
    }

  m_tcp->AddSocket (this);

  NS_LOG_LOGIC ("TcpSocketBase " << this << " got an endpoint: " << m_endPoint);

  return SetupCallback ();
}

void
TcpSocketBase::InitializeCwnd (void)
{
  m_tcb->m_cWnd = GetInitialCwnd() * GetSegSize();
  m_tcb->m_ssThresh = GetInitialSSThresh();
}

void
TcpSocketBase::SetInitialSSThresh (uint32_t threshold)
{
  NS_ABORT_MSG_UNLESS (m_state == CLOSED || threshold == m_tcb->m_initialSsThresh,
                       "TcpSocketBase::SetSSThresh() cannot change initial ssThresh after connection started.");

  m_tcb->m_initialSsThresh = threshold;
}

uint32_t
TcpSocketBase::GetInitialSSThresh (void) const
{
  return m_tcb->m_initialSsThresh;
}

void
TcpSocketBase::SetInitialCwnd (uint32_t cwnd)
{
  NS_ABORT_MSG_UNLESS (m_state == CLOSED || cwnd == m_tcb->m_initialCWnd,
                       "TcpSocketBase::SetInitialCwnd() cannot change initial cwnd after connection started.");

  m_tcb->m_initialCWnd = cwnd;
}

uint32_t
TcpSocketBase::GetInitialCwnd (void) const
{
  return m_tcb->m_initialCWnd;
}

void
TcpSocketBase::ScaleSsThresh (uint8_t scaleFactor)
{
  m_tcb->m_ssThresh <<= scaleFactor;
}

/* Inherit from Socket class: Initiate connection to a remote address:port */
int
TcpSocketBase::Connect (const Address & address)
{
  NS_LOG_FUNCTION (this << address);

  InitializeCwnd ();

  // If haven't do so, Bind() this socket first
  if (InetSocketAddress::IsMatchingType (address) && m_endPoint6 == 0)
    {
      if (m_endPoint == 0)
        {
          if (Bind () == -1)
            {
              NS_ASSERT (m_endPoint == 0);
              return -1; // Bind() failed
            }
          NS_ASSERT (m_endPoint != 0);
        }
      InetSocketAddress transport = InetSocketAddress::ConvertFrom (address);
      m_endPoint->SetPeer (transport.GetIpv4 (), transport.GetPort ());
      SetIpTos (transport.GetTos ());
      m_endPoint6 = 0;

      // Get the appropriate local address and port number from the routing protocol and set up endpoint
      if (SetupEndpoint () != 0)
        {
          NS_LOG_ERROR ("Route to destination does not exist ?!");
          return -1;
        }
    }
  else if (Inet6SocketAddress::IsMatchingType (address)  && m_endPoint == 0)
    {
      // If we are operating on a v4-mapped address, translate the address to
      // a v4 address and re-call this function
      Inet6SocketAddress transport = Inet6SocketAddress::ConvertFrom (address);
      Ipv6Address v6Addr = transport.GetIpv6 ();
      if (v6Addr.IsIpv4MappedAddress () == true)
        {
          Ipv4Address v4Addr = v6Addr.GetIpv4MappedAddress ();
          return Connect (InetSocketAddress (v4Addr, transport.GetPort ()));
        }

      if (m_endPoint6 == 0)
        {
          if (Bind6 () == -1)
            {
              NS_ASSERT (m_endPoint6 == 0);
              return -1; // Bind() failed
            }
          NS_ASSERT (m_endPoint6 != 0);
        }
      m_endPoint6->SetPeer (v6Addr, transport.GetPort ());
      m_endPoint = 0;

      // Get the appropriate local address and port number from the routing protocol and set up endpoint
      if (SetupEndpoint6 () != 0)
        { // Route to destination does not exist
          return -1;
        }
    }
  else
    {
      m_errno = ERROR_INVAL;
      return -1;
    }

  // Re-initialize parameters in case this socket is being reused after CLOSE
  m_rtt->Reset ();
  m_synCount = m_tcpParams->m_synRetries;
  m_dataRetrCount = m_tcpParams->m_dataRetries;

  // DoConnect() will do state-checking and send a SYN packet
  return DoConnect ();
}

/* Inherit from Socket class: Listen on the endpoint for an incoming connection */
int
TcpSocketBase::Listen (void)
{
  NS_LOG_FUNCTION (this);

  InitializeCwnd ();

  // Linux quits EINVAL if we're not in CLOSED state, so match what they do
  if (m_state != CLOSED)
    {
      m_errno = ERROR_INVAL;
      return -1;
    }
  // In other cases, set the state to LISTEN and done
  NS_LOG_DEBUG ("CLOSED -> LISTEN");
  m_state = LISTEN;
  return 0;
}

/* Inherit from Socket class: Kill this socket and signal the peer (if any) */
int
TcpSocketBase::Close (void)
{
  NS_LOG_FUNCTION (this);
  /// \internal
  /// First we check to see if there is any unread rx data.
  /// \bugid{426} claims we should send reset in this case.
  if (m_rxBuffer->Size () != 0)
    {
      NS_LOG_WARN ("Socket " << this << " << unread rx data during close.  Sending reset." <<
                   "This is probably due to a bad sink application; check its code");
      SendRST ();
      return 0;
    }

  if (m_txBuffer->SizeFromSequence (m_tcb->m_nextTxSequence) > 0)
    { // App close with pending data must wait until all data transmitted
      if (m_tcpParams->m_closeOnEmpty == false)
        {
          m_tcpParams->m_closeOnEmpty = true;
          NS_LOG_INFO ("Socket " << this << " deferring close, state " << TcpStateName[m_state]);
        }
      return 0;
    }
  return DoClose ();
}

/* Inherit from Socket class: Signal a termination of send */
int
TcpSocketBase::ShutdownSend (void)
{
  NS_LOG_FUNCTION (this);

  //this prevents data from being added to the buffer
  m_tcpParams->m_shutdownSend = true;
  m_tcpParams->m_closeOnEmpty = true;
  //if buffer is already empty, send a fin now
  //otherwise fin will go when buffer empties.
  if (m_txBuffer->Size () == 0)
    {
      if (m_state == ESTABLISHED || m_state == CLOSE_WAIT)
        {
          NS_LOG_INFO ("Emtpy tx buffer, send fin");
          SendEmptyPacket (TcpHeader::FIN);

          if (m_state == ESTABLISHED)
            { // On active close: I am the first one to send FIN
              NS_LOG_DEBUG ("ESTABLISHED -> FIN_WAIT_1");
              m_state = FIN_WAIT_1;
            }
          else
            { // On passive close: Peer sent me FIN already
              NS_LOG_DEBUG ("CLOSE_WAIT -> LAST_ACK");
              m_state = LAST_ACK;
            }
        }
    }

  return 0;
}

/* Inherit from Socket class: Signal a termination of receive */
int
TcpSocketBase::ShutdownRecv (void)
{
  NS_LOG_FUNCTION (this);
  m_tcpParams->m_shutdownRecv = true;
  return 0;
}

/* Inherit from Socket class: Send a packet. Parameter flags is not used.
    Packet has no TCP header. Invoked by upper-layer application */
int
TcpSocketBase::Send (Ptr<Packet> p, uint32_t flags)
{
  NS_LOG_FUNCTION (this << p);
  NS_ABORT_MSG_IF (flags, "use of flags is not supported in TcpSocketBase::Send()");
  if (m_state == ESTABLISHED || m_state == SYN_SENT || m_state == CLOSE_WAIT)
    {
      // Store the packet into Tx buffer
      if (!m_txBuffer->Add (p))
        { // TxBuffer overflow, send failed
          m_errno = ERROR_MSGSIZE;
          return -1;
        }
      if (m_tcpParams->m_shutdownSend)
        {
          m_errno = ERROR_SHUTDOWN;
          return -1;
        }
      // Submit the data to lower layers
      NS_LOG_LOGIC ("txBufSize=" << m_txBuffer->Size () << " state " << TcpStateName[m_state]);
      if (m_state == ESTABLISHED || m_state == CLOSE_WAIT)
        { // Try to send the data out
          if (!m_sendPendingDataEvent.IsRunning ())
            {
              m_sendPendingDataEvent = Simulator::Schedule (TimeStep (1),
                                                            &TcpSocketBase::SendPendingData,
                                                            this, m_connected);
            }
        }
      return p->GetSize ();
    }
  else
    { // Connection not established yet
      m_errno = ERROR_NOTCONN;
      return -1; // Send failure
    }
}

/* Inherit from Socket class: In TcpSocketBase, it is same as Send() call */
int
TcpSocketBase::SendTo (Ptr<Packet> p, uint32_t flags, const Address &address)
{
  return Send (p, flags); // SendTo() and Send() are the same
}

/* Inherit from Socket class: Return data to upper-layer application. Parameter flags
   is not used. Data is returned as a packet of size no larger than maxSize */
Ptr<Packet>
TcpSocketBase::Recv (uint32_t maxSize, uint32_t flags)
{
  NS_LOG_FUNCTION (this);
  NS_ABORT_MSG_IF (flags, "use of flags is not supported in TcpSocketBase::Recv()");
  if (m_rxBuffer->Size () == 0 && m_state == CLOSE_WAIT)
    {
      return Create<Packet> (); // Send EOF on connection close
    }
  Ptr<Packet> outPacket = m_rxBuffer->Extract (maxSize);
  return outPacket;
}

/* Inherit from Socket class: Recv and return the remote's address */
Ptr<Packet>
TcpSocketBase::RecvFrom (uint32_t maxSize, uint32_t flags, Address &fromAddress)
{
  NS_LOG_FUNCTION (this << maxSize << flags);
  Ptr<Packet> packet = Recv (maxSize, flags);
  // Null packet means no data to read, and an empty packet indicates EOF
  if (packet != 0 && packet->GetSize () != 0)
    {
      if (m_endPoint != 0)
        {
          fromAddress = InetSocketAddress (m_endPoint->GetPeerAddress (), m_endPoint->GetPeerPort ());
        }
      else if (m_endPoint6 != 0)
        {
          fromAddress = Inet6SocketAddress (m_endPoint6->GetPeerAddress (), m_endPoint6->GetPeerPort ());
        }
      else
        {
          fromAddress = InetSocketAddress (Ipv4Address::GetZero (), 0);
        }
    }
  return packet;
}

/* Inherit from Socket class: Get the max number of bytes an app can send */
uint32_t
TcpSocketBase::GetTxAvailable (void) const
{
  NS_LOG_FUNCTION (this);
  return m_txBuffer->Available ();
}

/* Inherit from Socket class: Get the max number of bytes an app can read */
uint32_t
TcpSocketBase::GetRxAvailable (void) const
{
  NS_LOG_FUNCTION (this);
  return m_rxBuffer->Available ();
}

Ptr<TcpTxBuffer32> TcpSocketBase::GetTxBuffer (void) const
{
  return m_txBuffer;
}

Ptr<TcpRxBuffer32> TcpSocketBase::GetRxBuffer (void) const
{
  return m_rxBuffer;
}

/* Inherit from Socket class: Return local address:port */
int
TcpSocketBase::GetSockName (Address &address) const
{
  NS_LOG_FUNCTION (this);
  if (m_endPoint != 0)
    {
      address = InetSocketAddress (m_endPoint->GetLocalAddress (), m_endPoint->GetLocalPort ());
    }
  else if (m_endPoint6 != 0)
    {
      address = Inet6SocketAddress (m_endPoint6->GetLocalAddress (), m_endPoint6->GetLocalPort ());
    }
  else
    { // It is possible to call this method on a socket without a name
      // in which case, behavior is unspecified
      // Should this return an InetSocketAddress or an Inet6SocketAddress?
      address = InetSocketAddress (Ipv4Address::GetZero (), 0);
    }
  return 0;
}

int
TcpSocketBase::GetPeerName (Address &address) const
{
  NS_LOG_FUNCTION (this << address);

  if (!m_endPoint && !m_endPoint6)
    {
      m_errno = ERROR_NOTCONN;
      return -1;
    }

  if (m_endPoint)
    {
      address = InetSocketAddress (m_endPoint->GetPeerAddress (),
                                   m_endPoint->GetPeerPort ());
    }
  else if (m_endPoint6)
    {
      address = Inet6SocketAddress (m_endPoint6->GetPeerAddress (),
                                    m_endPoint6->GetPeerPort ());
    }
  else
    {
      NS_ASSERT (false);
    }

  return 0;
}



//TcpSocketState*
//TcpSocketBase::GetTcb(){
//	return *m_tcb;
//}

/* Inherit from Socket class: Bind this socket to the specified NetDevice */
void
TcpSocketBase::BindToNetDevice (Ptr<NetDevice> netdevice)
{
  NS_LOG_FUNCTION (netdevice);
  //std::cout << "Hong Jiaming 6: TcpSocketBase::BindToNetDevice()" << std::endl; // This part is not called!?!
  Socket::BindToNetDevice (netdevice); // Includes sanity check
  if (m_endPoint == 0)
    {
      if (Bind () == -1)
        {
          NS_ASSERT (m_endPoint == 0);
          return;
        }
      NS_ASSERT (m_endPoint != 0);
    }
  m_endPoint->BindToNetDevice (netdevice);

  if (m_endPoint6 == 0)
    {
      if (Bind6 () == -1)
        {
          NS_ASSERT (m_endPoint6 == 0);
          return;
        }
      NS_ASSERT (m_endPoint6 != 0);
    }
  m_endPoint6->BindToNetDevice (netdevice);

  return;
}

/* Clean up after Bind. Set up callback functions in the end-point. */
int
TcpSocketBase::SetupCallback (void)
{
  NS_LOG_FUNCTION (this);

  if (m_endPoint == 0 && m_endPoint6 == 0)
    {
      return -1;
    }
  if (m_endPoint != 0)
    {
      m_endPoint->SetRxCallback (MakeCallback (&TcpSocketBase::ForwardUp, Ptr<TcpSocketBase> (this)));
      m_endPoint->SetIcmpCallback (MakeCallback (&TcpSocketBase::ForwardIcmp, Ptr<TcpSocketBase> (this)));
      m_endPoint->SetDestroyCallback (MakeCallback (&TcpSocketBase::Destroy, Ptr<TcpSocketBase> (this)));
    }
  if (m_endPoint6 != 0)
    {
      m_endPoint6->SetRxCallback (MakeCallback (&TcpSocketBase::ForwardUp6, Ptr<TcpSocketBase> (this)));
      m_endPoint6->SetIcmpCallback (MakeCallback (&TcpSocketBase::ForwardIcmp6, Ptr<TcpSocketBase> (this)));
      m_endPoint6->SetDestroyCallback (MakeCallback (&TcpSocketBase::Destroy6, Ptr<TcpSocketBase> (this)));
    }

  return 0;
}

/* Perform the real connection tasks: Send SYN if allowed, RST if invalid */
int
TcpSocketBase::DoConnect (void)
{
  NS_LOG_FUNCTION (this);

  // A new connection is allowed only if this socket does not have a connection
  if (m_state == CLOSED || m_state == LISTEN || m_state == SYN_SENT || m_state == LAST_ACK || m_state == CLOSE_WAIT)
    { // send a SYN packet and change state into SYN_SENT
      SendEmptyPacket (TcpHeader::SYN);
      NS_LOG_DEBUG (TcpStateName[m_state] << " -> SYN_SENT");
      m_state = SYN_SENT;
    }
  else if (m_state != TIME_WAIT)
    { // In states SYN_RCVD, ESTABLISHED, FIN_WAIT_1, FIN_WAIT_2, and CLOSING, an connection
      // exists. We send RST, tear down everything, and close this socket.
      SendRST ();
      CloseAndNotify ();
    }
  return 0;
}

/* Do the action to close the socket. Usually send a packet with appropriate
    flags depended on the current m_state. */
int
TcpSocketBase::DoClose (void)
{
  NS_LOG_FUNCTION (this);
  switch (m_state)
    {
    case SYN_RCVD:
    case ESTABLISHED:
      // send FIN to close the peer
      SendEmptyPacket (TcpHeader::FIN);
      NS_LOG_DEBUG ("ESTABLISHED -> FIN_WAIT_1");
      m_state = FIN_WAIT_1;
      break;
    case CLOSE_WAIT:
      // send FIN+ACK to close the peer
      SendEmptyPacket (TcpHeader::FIN | TcpHeader::ACK);
      NS_LOG_DEBUG ("CLOSE_WAIT -> LAST_ACK");
      m_state = LAST_ACK;
      break;
    case SYN_SENT:
    case CLOSING:
      // Send RST if application closes in SYN_SENT and CLOSING
      SendRST ();
      CloseAndNotify ();
      break;
    case LISTEN:
    case LAST_ACK:
      // In these three states, move to CLOSED and tear down the end point
      CloseAndNotify ();
      break;
    case CLOSED:
    case FIN_WAIT_1:
    case FIN_WAIT_2:
    case TIME_WAIT:
    default: /* mute compiler */
      // Do nothing in these four states
      break;
    }
  return 0;
}

/* Peacefully close the socket by notifying the upper layer and deallocate end point */
void
TcpSocketBase::CloseAndNotify (void)
{
  NS_LOG_FUNCTION (this);

  if (!m_tcpParams->m_closeNotified)
    {
      NotifyNormalClose ();
      m_tcpParams->m_closeNotified = true;
    }

  NS_LOG_DEBUG (TcpStateName[m_state] << " -> CLOSED");
  m_state = CLOSED;
  DeallocateEndPoint ();
}


/* Tell if a sequence number range is out side the range that my rx buffer can
    accpet */
bool
TcpSocketBase::OutOfRange (SequenceNumber32 head, SequenceNumber32 tail) const
{
  if (m_state == LISTEN || m_state == SYN_SENT || m_state == SYN_RCVD)
    { // Rx buffer in these states are not initialized.
      return false;
    }
  if (m_state == LAST_ACK || m_state == CLOSING || m_state == CLOSE_WAIT)
    { // In LAST_ACK and CLOSING states, it only wait for an ACK and the
      // sequence number must equals to m_rxBuffer->NextRxSequence ()
      return (m_rxBuffer->NextRxSequence () != head);
    }

  // In all other cases, check if the sequence number is in range
  return (tail < m_rxBuffer->NextRxSequence () || m_rxBuffer->MaxRxSequence () <= head);
}

/* Function called by the L3 protocol when it received a packet to pass on to
    the TCP. This function is registered as the "RxCallback" function in
    SetupCallback(), which invoked by Bind(), and CompleteFork() */
void
TcpSocketBase::ForwardUp (Ptr<Packet> packet, Ipv4Header header, uint16_t port,
                          Ptr<Ipv4Interface> incomingInterface)
{
  NS_LOG_LOGIC ("Socket " << this << " forward up " <<
                m_endPoint->GetPeerAddress () <<
                ":" << m_endPoint->GetPeerPort () <<
                " to " << m_endPoint->GetLocalAddress () <<
                ":" << m_endPoint->GetLocalPort ());

  Address fromAddress = InetSocketAddress (header.GetSource (), port);
  Address toAddress = InetSocketAddress (header.GetDestination (),
                                         m_endPoint->GetLocalPort ());

  DoForwardUp (packet, fromAddress, toAddress);
}

void
TcpSocketBase::ForwardUp6 (Ptr<Packet> packet, Ipv6Header header, uint16_t port,
                           Ptr<Ipv6Interface> incomingInterface)
{
  NS_LOG_LOGIC ("Socket " << this << " forward up " <<
                m_endPoint6->GetPeerAddress () <<
                ":" << m_endPoint6->GetPeerPort () <<
                " to " << m_endPoint6->GetLocalAddress () <<
                ":" << m_endPoint6->GetLocalPort ());

  Address fromAddress = Inet6SocketAddress (header.GetSourceAddress (), port);
  Address toAddress = Inet6SocketAddress (header.GetDestinationAddress (),
                                          m_endPoint6->GetLocalPort ());

  DoForwardUp (packet, fromAddress, toAddress);
}

void
TcpSocketBase::ForwardIcmp (Ipv4Address icmpSource, uint8_t icmpTtl,
                            uint8_t icmpType, uint8_t icmpCode,
                            uint32_t icmpInfo)
{
  NS_LOG_FUNCTION (this << icmpSource << (uint32_t)icmpTtl << (uint32_t)icmpType <<
                   (uint32_t)icmpCode << icmpInfo);
  if (!m_icmpCallback.IsNull ())
    {
      m_icmpCallback (icmpSource, icmpTtl, icmpType, icmpCode, icmpInfo);
    }
}

void
TcpSocketBase::ForwardIcmp6 (Ipv6Address icmpSource, uint8_t icmpTtl,
                             uint8_t icmpType, uint8_t icmpCode,
                             uint32_t icmpInfo)
{
  NS_LOG_FUNCTION (this << icmpSource << (uint32_t)icmpTtl << (uint32_t)icmpType <<
                   (uint32_t)icmpCode << icmpInfo);
  if (!m_icmpCallback6.IsNull ())
    {
      m_icmpCallback6 (icmpSource, icmpTtl, icmpType, icmpCode, icmpInfo);
    }
}


// Get a packet from L3. This is the real function to handle the incoming packet from lower layers.
// This is wrapped by ForwardUp() so that this function can be overloaded by daughter classes.
void
TcpSocketBase::DoForwardUp (Ptr<Packet> packet, const Address &fromAddress,
                            const Address &toAddress)
{
  // in case the packet still has a priority tag attached, remove it
  SocketPriorityTag priorityTag;
  packet->RemovePacketTag (priorityTag);

  // Peel off TCP header and do validity checking
  TcpHeader tcpHeader;
  uint32_t bytesRemoved = packet->RemoveHeader (tcpHeader);
  NS_LOG_LOGIC ("Hong Jiaming: tcpHeader size == " << tcpHeader.GetSerializedSize());
  SequenceNumber32 seq = tcpHeader.GetSequenceNumber ();
  if (bytesRemoved == 0 || bytesRemoved > 60)
    {
      NS_LOG_ERROR ("Bytes removed: " << bytesRemoved << " invalid");
      return; // Discard invalid packet
    }
  else if (packet->GetSize () > 0 && OutOfRange (seq, seq + packet->GetSize ()))
    {
      // Discard fully out of range data packets
      NS_LOG_LOGIC ("At state " << TcpStateName[m_state] <<
                    " received packet of seq [" << seq <<
                    ":" << seq + packet->GetSize () <<
                    ") out of range [" << m_rxBuffer->NextRxSequence () << ":" <<
                    m_rxBuffer->MaxRxSequence () << ")");
      // Acknowledgement should be sent for all unacceptable packets (RFC793, p.69)
      if (m_state == ESTABLISHED && !(tcpHeader.GetFlags () & TcpHeader::RST))
        {
          SendEmptyPacket (TcpHeader::ACK);
        }
      return;
    }


  m_rxTrace (packet, tcpHeader, this);
  NS_LOG_LOGIC("Hong Jiaming 10: TcpSocketBase::DoForwardUp tcpHeader == " << tcpHeader << " m_timestampEnabled == " << m_tcpParams->m_timestampEnabled);
  if (tcpHeader.GetFlags () & TcpHeader::SYN)
    {
      /* The window field in a segment where the SYN bit is set (i.e., a <SYN>
       * or <SYN,ACK>) MUST NOT be scaled (from RFC 7323 page 9). But should be
       * saved anyway.. UpdateWindowSize does the correct thing.
       */
      UpdateWindowSize(tcpHeader);

      if (tcpHeader.HasOption (TcpOption::WINSCALE) && m_tcpParams->m_winScalingEnabled)
        {
          ProcessOptionWScale (tcpHeader.GetOption (TcpOption::WINSCALE));
        }
      else
        {
          m_tcpParams->m_winScalingEnabled = false;
        }

      // When receiving a <SYN> or <SYN-ACK> we should adapt TS to the other end
      if (tcpHeader.HasOption (TcpOption::TS) && m_tcpParams->m_timestampEnabled)
        {
          // Hong Jiaming: for wireless connection, program goes here!!!
          NS_LOG_LOGIC("Hong Jiaming 10: TcpSocketBase::DoForwardUp tcpHeader.GetOption (TcpOption::TS) == " << DynamicCast<const TcpOptionTS>(tcpHeader.GetOption (TcpOption::TS))->GetTimestamp());
          ProcessOptionTimestamp (tcpHeader.GetOption (TcpOption::TS),
                                  tcpHeader.GetSequenceNumber ());
        }
      else
        {
          // Hong Jiaming: for wired connection, program goes here!!!
          NS_LOG_LOGIC("Hong Jiaming 10: TcpSocketBase::DoForwardUp m_timestampEnabled is set to be false ");
          m_tcpParams->m_timestampEnabled = false;
        }

      // Initialize cWnd and ssThresh
      m_tcb->m_cWnd = GetInitialCwnd () * GetSegSize ();
      m_tcb->m_ssThresh = GetInitialSSThresh ();

      if (tcpHeader.GetFlags () & TcpHeader::ACK)
        {
          EstimateRtt (tcpHeader);
          m_highRxAckMark = tcpHeader.GetAckNumber ();
        }
    }
  else if (tcpHeader.GetFlags () & TcpHeader::ACK)
    {
      NS_ASSERT (!(tcpHeader.GetFlags () & TcpHeader::SYN));
      if (m_tcpParams->m_timestampEnabled)
        {
          if (!tcpHeader.HasOption (TcpOption::TS))
            {
              // Ignoring segment without TS, RFC 7323
              NS_LOG_LOGIC ("At state " << TcpStateName[m_state] <<
                            " received packet of seq [" << seq <<
                            ":" << seq + packet->GetSize () <<
                            ") without TS option. Silently discard it." <<
                            " Hong Jiaming: tcpHeader size == " << tcpHeader.GetSerializedSize());
              return;
            }
          else
            {
              ProcessOptionTimestamp (tcpHeader.GetOption (TcpOption::TS),
                                      tcpHeader.GetSequenceNumber ());
            }
        }

      EstimateRtt (tcpHeader);
      UpdateWindowSize (tcpHeader);
    }

  //Process any options with side effects before running main TCP state machine
  ProcessOptions(tcpHeader, false);

  if (m_rWnd.Get () == 0 && m_persistEvent.IsExpired ())
    { // Zero window: Enter persist state to send 1 byte to probe
      NS_LOG_LOGIC (this << " Enter zerowindow persist state");
      NS_LOG_LOGIC (this << " Cancelled ReTxTimeout event which was set to expire at " <<
                    (Simulator::Now () + Simulator::GetDelayLeft (m_retxEvent)).GetSeconds ());
      m_retxEvent.Cancel ();
      NS_LOG_LOGIC ("Schedule persist timeout at time " <<
                    Simulator::Now ().GetSeconds () << " to expire at time " <<
                    (Simulator::Now () + m_tcpParams->m_persistTimeout).GetSeconds ());
      m_persistEvent = Simulator::Schedule (m_tcpParams->m_persistTimeout, &TcpSocketBase::PersistTimeout, this);
      NS_ASSERT (m_tcpParams->m_persistTimeout == Simulator::GetDelayLeft (m_persistEvent));
    }

  // TCP state machine code in different process functions
  // C.f.: tcp_rcv_state_process() in tcp_input.c in Linux kernel
  switch (m_state)
    {
    case ESTABLISHED:
      ProcessEstablished (packet, tcpHeader);
      break;
    case LISTEN:
      ProcessListen (packet, tcpHeader, fromAddress, toAddress);
      break;
    case TIME_WAIT:
      // Do nothing
      break;
    case CLOSED:
      // Send RST if the incoming packet is not a RST
      if ((tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG)) != TcpHeader::RST)
        { // Since m_endPoint is not configured yet, we cannot use SendRST here
          TcpHeader h;
          GenerateEmptyPacketHeader(h, TcpHeader::RST);
          h.SetSourcePort (tcpHeader.GetDestinationPort ());
          h.SetDestinationPort (tcpHeader.GetSourcePort ());
          // Do we really need that in a RST ?
          Ptr<Packet> p = Create<Packet>();
          m_txTrace (p, h, this);
          //std::cout<< "TcpSocketBase::DoForwardUp: next is SendPacket(h, p)"<<std::endl;
          SendPacket(h, p);
          //std::cout<< "TcpSocketBase::DoForwardUp: just called SendPacket(h, p)\n"<<std::endl;

        }
      break;
    case SYN_SENT:
      ProcessSynSent (packet, tcpHeader);
      break;
    case SYN_RCVD:
      ProcessSynRcvd (packet, tcpHeader, fromAddress, toAddress);
      break;
    case FIN_WAIT_1:
    case FIN_WAIT_2:
    case CLOSE_WAIT:
      ProcessWait (packet, tcpHeader);
      break;
    case CLOSING:
      ProcessClosing (packet, tcpHeader);
      break;
    case LAST_ACK:
      ProcessLastAck (packet, tcpHeader);
      break;
    default: // mute compiler
      break;
    }

  //Process any options with side effects after running main TCP state machine
  ProcessOptions(tcpHeader, true);

  if (m_rWnd.Get () != 0 && m_persistEvent.IsRunning ())
    { // persist probes end, the other end has increased the window
      NS_ASSERT (m_connected);
      NS_LOG_LOGIC (this << " Leaving zerowindow persist state");
      m_persistEvent.Cancel ();

      // Try to send more data, since window has been updated
      if (!m_sendPendingDataEvent.IsRunning ())
        {
          m_sendPendingDataEvent = Simulator::Schedule (TimeStep (1),
                                                        &TcpSocketBase::SendPendingData,
                                                        this, m_connected);
        }
    }
}

/* Received a packet upon ESTABLISHED state. This function is mimicking the
    role of tcp_rcv_established() in tcp_input.c in Linux kernel. */
void
TcpSocketBase::ProcessEstablished (Ptr<Packet> packet, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Extract the flags. PSH and URG are not honoured.
  uint8_t tcpflags = tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG);

  // Different flags are different events
  if (tcpflags == TcpHeader::ACK)
    {
      if (tcpHeader.GetAckNumber () < m_txBuffer->HeadSequence ())
        {
          // Case 1:  If the ACK is a duplicate (SEG.ACK < SND.UNA), it can be ignored.
          // Pag. 72 RFC 793
          NS_LOG_LOGIC ("Ignored ack of " << tcpHeader.GetAckNumber () <<
                        " SND.UNA = " << m_txBuffer->HeadSequence ());

          // TODO: RFC 5961 5.2 [Blind Data Injection Attack].[Mitigation]
        }
      else if (tcpHeader.GetAckNumber () > m_tcb->m_highTxMark)
        {
          // If the ACK acks something not yet sent (SEG.ACK > HighTxMark) then
          // send an ACK, drop the segment, and return.
          // Pag. 72 RFC 793
          NS_LOG_LOGIC ("Ignored ack of " << tcpHeader.GetAckNumber () <<
                        " HighTxMark = " << m_tcb->m_highTxMark);

          SendEmptyPacket (TcpHeader::ACK);
        }
      else
        {
          // SND.UNA < SEG.ACK =< HighTxMark
          // Pag. 72 RFC 793
          ReceivedAck (packet, tcpHeader);
        }
    }
  else if (tcpflags == TcpHeader::SYN)
    { // Received SYN, old NS-3 behaviour is to set state to SYN_RCVD and
      // respond with a SYN+ACK. But it is not a legal state transition as of
      // RFC793. Thus this is ignored.
    }
  else if (tcpflags == (TcpHeader::SYN | TcpHeader::ACK))
    { // No action for received SYN+ACK, it is probably a duplicated packet
    }
  else if (tcpflags == TcpHeader::FIN || tcpflags == (TcpHeader::FIN | TcpHeader::ACK))
    { // Received FIN or FIN+ACK, bring down this socket nicely
      PeerClose (packet, tcpHeader);
    }
  else if (tcpflags == 0)
    { // No flags means there is only data
      ReceivedData (packet, tcpHeader);
      if (m_rxBuffer->Finished ())
        {
          PeerClose (packet, tcpHeader);
        }
    }
  else
    { // Received RST or the TCP flags is invalid, in either case, terminate this socket
      if (tcpflags != TcpHeader::RST)
        { // this must be an invalid flag, send reset
          NS_LOG_LOGIC ("Illegal flag " << TcpHeader::FlagsToString (tcpflags) << " received. Reset packet is sent.");
          SendRST ();
        }
      CloseAndNotify ();
    }
}

uint32_t TcpSocketBase::get1r() const {
	return l_1r;
}

void TcpSocketBase::set1r(uint32_t _1r) {
	l_1r = _1r;
}

uint32_t TcpSocketBase::get2r() const {
	return l_2r;
}

void TcpSocketBase::set2r(uint32_t _2r) {
	l_2r = _2r;
}

uint32_t TcpSocketBase::getlr() const {
	return lr;
}

void TcpSocketBase::setlr(uint32_t l_r) {
	lr = l_r;
}

/* Process the newly received ACK */
void
TcpSocketBase::ReceivedAck (Ptr<Packet> packet, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  NS_ASSERT (0 != (tcpHeader.GetFlags () & TcpHeader::ACK));
  NS_ASSERT (m_tcb->m_segmentSize > 0);

  SequenceNumber32 ackNumber = tcpHeader.GetAckNumber ();
  uint32_t bytesAcked = ackNumber - m_txBuffer->HeadSequence ();
  uint32_t segsAcked  = bytesAcked / m_tcb->m_segmentSize;
  m_bytesAckedNotProcessed += bytesAcked % m_tcb->m_segmentSize;

  if (m_bytesAckedNotProcessed >= m_tcb->m_segmentSize)
    {
      segsAcked += 1;
      m_bytesAckedNotProcessed -= m_tcb->m_segmentSize;
    }

  //update the l_1r for olia
  this->set2r(this->get2r()+bytesAcked);
  this->setlr(this->get1r()>this->get2r()?this->get1r():this->get2r());
  NS_LOG_UNCOND("RTT:"<<this->GetRttEstimator()->GetEstimate().GetMicroSeconds()<<endl);


//  NS_LOG_UNCOND(endl<<"Tcp id"<<this->m_tcb<<" received ack!");
//  NS_LOG_LOGIC (" Bytes acked: " << bytesAcked <<
//  NS_LOG_UNCOND(" Bytes acked: " << bytesAcked <<
//                " Segments acked: " << segsAcked <<
//                " bytes left: " << m_bytesAckedNotProcessed);

//  NS_LOG_DEBUG
//  NS_LOG_UNCOND("ACK of " << ackNumber <<
//                " SND.UNA=" << m_txBuffer->HeadSequence () <<
//                " SND.NXT=" << m_tcb->m_nextTxSequence);
//  NS_LOG_UNCOND("Dupack count:"<<m_dupAckCount);

  m_tcb->m_lastAckedSeq = ackNumber;

  if (ackNumber == m_txBuffer->HeadSequence ()
      && ackNumber < m_tcb->m_nextTxSequence
      && packet->GetSize () == 0)
    {
      // There is a DupAck
      ++m_dupAckCount;



      if (m_tcb->m_congState == TcpSocketState::CA_OPEN)
        {
          // From Open we go Disorder
          NS_ASSERT_MSG (m_dupAckCount == 1, "From OPEN->DISORDER but with " <<
                         m_dupAckCount << " dup ACKs");

          m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_DISORDER);
          m_tcb->m_congState = TcpSocketState::CA_DISORDER;

          if (m_tcpParams->m_limitedTx && m_txBuffer->SizeFromSequence (m_tcb->m_nextTxSequence) > 0)
            {
              // RFC3042 Limited transmit: Send a new packet for each duplicated ACK before fast retransmit
              NS_LOG_INFO ("Limited transmit");
              uint32_t sz = SendDataPacket (m_tcb->m_nextTxSequence, m_tcb->m_segmentSize, true);
              m_tcb->m_nextTxSequence += sz;
            }

          NS_LOG_DEBUG ("OPEN -> DISORDER");
        }
      else if (m_tcb->m_congState == TcpSocketState::CA_DISORDER)
        {
          if ((m_dupAckCount == m_tcpParams->m_retxThresh) && (m_highRxAckMark >= m_recover))
            {
              // triple duplicate ack triggers fast retransmit (RFC2582 sec.3 bullet #1)
//              NS_LOG_DEBUG
//			  NS_LOG_UNCOND(TcpSocketState::TcpCongStateName[m_tcb->m_congState] <<
//                            " -> RECOVERY");
              m_recover = m_tcb->m_highTxMark;
              m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_RECOVERY);
              m_tcb->m_congState = TcpSocketState::CA_RECOVERY;

              //considered as loss then we update l_1r and l_2r
              this->set1r(this->get2r());
              this->set2r(0);
              this->setlr(this->get1r()>this->get2r()?this->get1r():this->get2r());

              m_tcb->m_ssThresh = m_congestionControl->GetSsThresh (m_tcb,
                                                                    BytesInFlight ());
              m_tcb->m_cWnd = m_tcb->m_ssThresh + m_dupAckCount * m_tcb->m_segmentSize;

              NS_LOG_INFO (m_dupAckCount << " dupack. Enter fast recovery mode." <<
                           "Reset cwnd to " << m_tcb->m_cWnd << ", ssthresh to " <<
                           m_tcb->m_ssThresh << " at fast recovery seqnum " << m_recover);
              DoRetransmit ();
            }
          else if (m_tcpParams->m_limitedTx && m_txBuffer->SizeFromSequence (m_tcb->m_nextTxSequence) > 0)
            {
              // RFC3042 Limited transmit: Send a new packet for each duplicated ACK before fast retransmit
              NS_LOG_INFO ("Limited transmit");
              uint32_t sz = SendDataPacket (m_tcb->m_nextTxSequence, m_tcb->m_segmentSize, true);
              m_tcb->m_nextTxSequence += sz;
            }
        }
      else if (m_tcb->m_congState == TcpSocketState::CA_RECOVERY)
        { // Increase cwnd for every additional dupack (RFC2582, sec.3 bullet #3)
          m_tcb->m_cWnd += m_tcb->m_segmentSize;
          NS_LOG_INFO (m_dupAckCount << " Dupack received in fast recovery mode."
                       "Increase cwnd to " << m_tcb->m_cWnd);
          SendPendingData (m_connected);
        }
      else if (m_tcb->m_congState == TcpSocketState::CA_LOSS)
        {
          // What happens if we are in loss state and a DUPack is received?
        }
      // Artificially call PktsAcked. After all, one segment has been ACKed.
      m_congestionControl->PktsAcked (m_tcb, 1, m_lastRtt);
    }
  else if (ackNumber == m_txBuffer->HeadSequence ()
           && ackNumber == m_tcb->m_nextTxSequence)
    {
      // Dupack, but the ACK is precisely equal to the nextTxSequence
    }
  else if (ackNumber > m_txBuffer->HeadSequence ())
    { // Case 3: New ACK, reset m_dupAckCount and update m_txBuffer
      bool callCongestionControl = true;
      bool resetRTO = true;

      /* The following switch is made because m_dupAckCount can be
       * "inflated" through out-of-order segments (e.g. from retransmission,
       * while segments have not been lost but are network-reordered). At
       * least one segment has been acked; in the luckiest case, an amount
       * equals to segsAcked-m_dupAckCount has not been processed.
       *
       * To be clear: segsAcked will be passed to PktsAcked, and it should take
       * in considerations the times that it has been already called, while newSegsAcked
       * will be passed to IncreaseCwnd, and it represents the amount of
       * segments that are allowed to increase the cWnd value.
       */
      uint32_t newSegsAcked = segsAcked;
      if (segsAcked > m_dupAckCount)
        {
          segsAcked -= m_dupAckCount;
        }
      else
        {
          segsAcked = 1;
        }

      if (m_tcb->m_congState == TcpSocketState::CA_OPEN)
        {
          m_congestionControl->PktsAcked (m_tcb, segsAcked, m_lastRtt);
        }
      else if (m_tcb->m_congState == TcpSocketState::CA_DISORDER)
        {
          // The network reorder packets. Linux changes the counting lost
          // packet algorithm from FACK to NewReno. We simply go back in Open.
          m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_OPEN);
          m_tcb->m_congState = TcpSocketState::CA_OPEN;
          m_congestionControl->PktsAcked (m_tcb, segsAcked, m_lastRtt);
          m_dupAckCount = 0;
          m_retransOut = 0;

          NS_LOG_DEBUG ("DISORDER -> OPEN");
        }
      else if (m_tcb->m_congState == TcpSocketState::CA_RECOVERY)
        {
          if (ackNumber < m_recover)
            {
              /* Partial ACK.
               * In case of partial ACK, retransmit the first unacknowledged
               * segment. Deflate the congestion window by the amount of new
               * data acknowledged by the Cumulative Acknowledgment field.
               * If the partial ACK acknowledges at least one SMSS of new data,
               * then add back SMSS bytes to the congestion window.
               * This artificially inflates the congestion window in order to
               * reflect the additional segment that has left the network.
               * Send a new segment if permitted by the new value of cwnd.
               * This "partial window deflation" attempts to ensure that, when
               * fast recovery eventually ends, approximately ssthresh amount
               * of data will be outstanding in the network.  Do not exit the
               * fast recovery procedure (i.e., if any duplicate ACKs subsequently
               * arrive, execute step 4 of Section 3.2 of [RFC5681]).
                */
              m_tcb->m_cWnd = SafeSubtraction (m_tcb->m_cWnd, bytesAcked);

              if (segsAcked >= 1)
                {
                  m_tcb->m_cWnd += m_tcb->m_segmentSize;
                }

              callCongestionControl = false; // No congestion control on cWnd show be invoked
              m_dupAckCount = SafeSubtraction (m_dupAckCount, segsAcked); // Update the dupAckCount
              m_retransOut  = SafeSubtraction (m_retransOut, 1);  // at least one retransmission
            // has reached the other side
              m_txBuffer->DiscardUpTo (ackNumber);  //Bug 1850:  retransmit before newack
              DoRetransmit (); // Assume the next seq is lost. Retransmit lost packet

              if (m_isFirstPartialAck)
                {
                  m_isFirstPartialAck = false;
                }
              else
                {
                  resetRTO = false;
                }

              /* This partial ACK acknowledge the fact that one segment has been
               * previously lost and now successfully received. All others have
               * been processed when they come under the form of dupACKs
               */
              m_congestionControl->PktsAcked (m_tcb, 1, m_lastRtt);

              NS_LOG_INFO ("Partial ACK for seq " << ackNumber <<
                           " in fast recovery: cwnd set to " << m_tcb->m_cWnd <<
                           " recover seq: " << m_recover <<
                           " dupAck count: " << m_dupAckCount);
            }
          else if (ackNumber >= m_recover)
            { // Full ACK (RFC2582 sec.3 bullet #5 paragraph 2, option 1)
              m_tcb->m_cWnd = std::min (m_tcb->m_ssThresh.Get (),
                                        BytesInFlight () + m_tcb->m_segmentSize);
              m_isFirstPartialAck = true;
              m_dupAckCount = 0;
              m_retransOut = 0;

              /* This FULL ACK acknowledge the fact that one segment has been
               * previously lost and now successfully received. All others have
               * been processed when they come under the form of dupACKs,
               * except the (maybe) new ACKs which come from a new window
               */
              m_congestionControl->PktsAcked (m_tcb, segsAcked, m_lastRtt);
              newSegsAcked = (ackNumber - m_recover) / m_tcb->m_segmentSize;
              m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_OPEN);
              m_tcb->m_congState = TcpSocketState::CA_OPEN;

              NS_LOG_INFO ("Received full ACK for seq " << ackNumber <<
                           ". Leaving fast recovery with cwnd set to " << m_tcb->m_cWnd);
              NS_LOG_DEBUG ("RECOVERY -> OPEN");
            }
        }
      else if (m_tcb->m_congState == TcpSocketState::CA_LOSS)
        {
          // Go back in OPEN state
          m_isFirstPartialAck = true;
          m_congestionControl->PktsAcked (m_tcb, segsAcked, m_lastRtt);
          m_dupAckCount = 0;
          m_retransOut = 0;
          m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_OPEN);
          m_tcb->m_congState = TcpSocketState::CA_OPEN;
          NS_LOG_DEBUG ("LOSS -> OPEN");
        }

      if (callCongestionControl)
        {
          m_congestionControl->IncreaseWindow (m_tcb, newSegsAcked);

          NS_LOG_LOGIC ("Congestion control called: " <<
                        " cWnd: " << m_tcb->m_cWnd <<
                        " ssTh: " << m_tcb->m_ssThresh);
        }

      // Reset the data retransmission count. We got a new ACK!
      m_dataRetrCount = m_tcpParams->m_dataRetries;

      if (m_isFirstPartialAck == false)
        {
          NS_ASSERT (m_tcb->m_congState == TcpSocketState::CA_RECOVERY);
        }

      NewAck (tcpHeader, resetRTO);

      // Try to send more data
      if (!m_sendPendingDataEvent.IsRunning ())
        {
          m_sendPendingDataEvent = Simulator::Schedule (TimeStep (1),
                                                        &TcpSocketBase::SendPendingData,
                                                        this, m_connected);
        }
    }

  // If there is any data piggybacked, store it into m_rxBuffer
  if (packet->GetSize () > 0)
    {
      ReceivedData (packet, tcpHeader);
    }
}

/* Received a packet upon LISTEN state. */
void
TcpSocketBase::ProcessListen (Ptr<Packet> packet, const TcpHeader& tcpHeader,
                              const Address& fromAddress, const Address& toAddress)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Extract the flags. PSH and URG are not honoured.
  uint8_t tcpflags = tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG);

  // Fork a socket if received a SYN. Do nothing otherwise.
  // C.f.: the LISTEN part in tcp_v4_do_rcv() in tcp_ipv4.c in Linux kernel
  if (tcpflags != TcpHeader::SYN)
    {
      return;
    }

  // Call socket's notify function to let the server app know we got a SYN
  // If the server app refuses the connection, do nothing
  if (!NotifyConnectionRequest (fromAddress))
    {
      return;
    }

  /**
    we first forked here, socket is not registered into TCPL4Protocol yet
   **/
  Ptr<TcpSocketImpl> newSock = Fork();
  //newSock->ResetUserCallbacks ();

  NS_LOG_LOGIC ("Cloned a TcpSocketBase " << newSock);
  Simulator::ScheduleNow (&TcpSocketImpl::CompleteFork, newSock,
                          packet, tcpHeader, fromAddress, toAddress);
}

void
TcpSocketBase::ResetUserCallbacks (void)
{

  Callback<void, Ptr< Socket > > vPS = MakeNullCallback<void, Ptr<Socket> > ();
  Callback<void, Ptr<Socket>, const Address &> vPSA = MakeNullCallback<void, Ptr<Socket>, const Address &> ();
  Callback<void, Ptr<Socket>, uint32_t> vPSUI = MakeNullCallback<void, Ptr<Socket>, uint32_t> ();
  SetConnectCallback (vPS, vPS);
  SetDataSentCallback (vPSUI);
  SetSendCallback (vPSUI);
  SetRecvCallback (vPS);
}

void TcpSocketBase::EstablishConnection(Ptr<Packet> packet, const TcpHeader& tcpHeader, bool sendAck)
{
  NS_LOG_DEBUG ("SYN_SENT -> ESTABLISHED");
  m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_OPEN);
  m_state = ESTABLISHED;
  m_connected = true;
  m_retxEvent.Cancel ();
  m_rxBuffer->SetNextRxSequence (tcpHeader.GetSequenceNumber () + SequenceNumber32 (1));
  m_tcb->m_highTxMark = ++m_tcb->m_nextTxSequence;
  m_txBuffer->SetHeadSequence (m_tcb->m_nextTxSequence);

  if(sendAck)
  {
    SendEmptyPacket (TcpHeader::ACK);
  }
}

/* Received a packet upon SYN_SENT */
void
TcpSocketBase::ProcessSynSent (Ptr<Packet> packet, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Extract the flags. PSH and URG are not honoured.
  uint8_t tcpflags = tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG);

  if (tcpflags == 0)
    { // Bare data, accept it and move to ESTABLISHED state. This is not a normal behaviour. Remove this?
      NS_LOG_DEBUG ("SYN_SENT -> ESTABLISHED");
      m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_OPEN);
      m_state = ESTABLISHED;
      m_connected = true;
      m_retxEvent.Cancel ();
      m_delAckCount = m_tcpParams->m_delAckMaxCount;
      ReceivedData (packet, tcpHeader);
      Simulator::ScheduleNow (&TcpSocketBase::ConnectionSucceeded, this);
    }
  else if (tcpflags == TcpHeader::ACK)
    { // Ignore ACK in SYN_SENT
    }
  else if (tcpflags == TcpHeader::SYN)
    { // Received SYN, move to SYN_RCVD state and respond with SYN+ACK
      NS_LOG_DEBUG ("SYN_SENT -> SYN_RCVD");
      m_state = SYN_RCVD;
      m_synCount = m_tcpParams->m_synRetries;
      m_rxBuffer->SetNextRxSequence (tcpHeader.GetSequenceNumber () + SequenceNumber32 (1));
      SendEmptyPacket (TcpHeader::SYN | TcpHeader::ACK);
    }
  else if (tcpflags == (TcpHeader::SYN | TcpHeader::ACK)
           && m_tcb->m_nextTxSequence + SequenceNumber32 (1) == tcpHeader.GetAckNumber ())
    { // Handshake completed

      EstablishConnection (packet, tcpHeader, true);

      SendPendingData (m_connected);
      Simulator::ScheduleNow (&TcpSocketBase::ConnectionSucceeded, this);
      // Always respond to first data packet to speed up the connection.
      // Remove to get the behaviour of old NS-3 code.
      m_delAckCount = m_tcpParams->m_delAckMaxCount;

    }
  else
    { // Other in-sequence input
      if (tcpflags != TcpHeader::RST)
        { // When (1) rx of FIN+ACK; (2) rx of FIN; (3) rx of bad flags
          NS_LOG_LOGIC ("Illegal flag " << TcpHeader::FlagsToString (tcpflags) <<
                        " received. Reset packet is sent.");
          SendRST ();
        }
      CloseAndNotify ();
    }
}

/* Received a packet upon SYN_RCVD */
void
TcpSocketBase::ProcessSynRcvd (Ptr<Packet> packet, const TcpHeader& tcpHeader,
                               const Address& fromAddress, const Address& toAddress)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Extract the flags. PSH and URG are not honoured.
  uint8_t tcpflags = tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG);

  if (tcpflags == 0
      || (tcpflags == TcpHeader::ACK
          && m_tcb->m_nextTxSequence + SequenceNumber32 (1) == tcpHeader.GetAckNumber ()))
    { // If it is bare data, accept it and move to ESTABLISHED state. This is
      // possibly due to ACK lost in 3WHS. If in-sequence ACK is received, the
      // handshake is completed nicely.
      NS_LOG_DEBUG ("SYN_RCVD -> ESTABLISHED");
      m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_OPEN);
      m_state = ESTABLISHED;
      m_connected = true;
      m_retxEvent.Cancel ();
      m_tcb->m_highTxMark = ++m_tcb->m_nextTxSequence;
      m_txBuffer->SetHeadSequence (m_tcb->m_nextTxSequence);

      if (m_endPoint)
        {
          m_endPoint->SetPeer (InetSocketAddress::ConvertFrom (fromAddress).GetIpv4 (),
                               InetSocketAddress::ConvertFrom (fromAddress).GetPort ());
        }
      else if (m_endPoint6)
        {
          m_endPoint6->SetPeer (Inet6SocketAddress::ConvertFrom (fromAddress).GetIpv6 (),
                                Inet6SocketAddress::ConvertFrom (fromAddress).GetPort ());
        }
      // Always respond to first data packet to speed up the connection.
      // Remove to get the behaviour of old NS-3 code.
      m_delAckCount = m_tcpParams->m_delAckMaxCount;

      ReceivedAck (packet, tcpHeader);
      NotifyNewConnectionCreated (this, fromAddress);
      // As this connection is established, the socket is available to send data now
      if (GetTxAvailable () > 0)
        {
          NotifySend (GetTxAvailable ());
        }
    }
  else if (tcpflags == TcpHeader::SYN)
    { // Probably the peer lost my SYN+ACK
      m_rxBuffer->SetNextRxSequence (tcpHeader.GetSequenceNumber () + SequenceNumber32 (1));
      SendEmptyPacket (TcpHeader::SYN | TcpHeader::ACK);
    }
  else if (tcpflags == (TcpHeader::FIN | TcpHeader::ACK))
    {
      if (tcpHeader.GetSequenceNumber () == m_rxBuffer->NextRxSequence ())
        { // In-sequence FIN before connection complete. Set up connection and close.
          m_connected = true;
          m_retxEvent.Cancel ();
          m_tcb->m_highTxMark = ++m_tcb->m_nextTxSequence;
          m_txBuffer->SetHeadSequence (m_tcb->m_nextTxSequence);
          if (m_endPoint)
            {
              m_endPoint->SetPeer (InetSocketAddress::ConvertFrom (fromAddress).GetIpv4 (),
                                   InetSocketAddress::ConvertFrom (fromAddress).GetPort ());
            }
          else if (m_endPoint6)
            {
              m_endPoint6->SetPeer (Inet6SocketAddress::ConvertFrom (fromAddress).GetIpv6 (),
                                    Inet6SocketAddress::ConvertFrom (fromAddress).GetPort ());
            }
          PeerClose (packet, tcpHeader);
        }
    }
  else
    { // Other in-sequence input
      if (tcpflags != TcpHeader::RST)
        { // When (1) rx of SYN+ACK; (2) rx of FIN; (3) rx of bad flags
          NS_LOG_LOGIC ("Illegal flag " << TcpHeader::FlagsToString (tcpflags) <<
                        " received. Reset packet is sent.");
          if (m_endPoint)
            {
              m_endPoint->SetPeer (InetSocketAddress::ConvertFrom (fromAddress).GetIpv4 (),
                                   InetSocketAddress::ConvertFrom (fromAddress).GetPort ());
            }
          else if (m_endPoint6)
            {
              m_endPoint6->SetPeer (Inet6SocketAddress::ConvertFrom (fromAddress).GetIpv6 (),
                                    Inet6SocketAddress::ConvertFrom (fromAddress).GetPort ());
            }
          SendRST ();
        }
      CloseAndNotify ();
    }
}

/* Received a packet upon CLOSE_WAIT, FIN_WAIT_1, or FIN_WAIT_2 states */
void
TcpSocketBase::ProcessWait (Ptr<Packet> packet, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Extract the flags. PSH and URG are not honoured.
  uint8_t tcpflags = tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG);

  if (packet->GetSize () > 0 && tcpflags != TcpHeader::ACK)
    { // Bare data, accept it
      ReceivedData (packet, tcpHeader);
    }
  else if (tcpflags == TcpHeader::ACK)
    { // Process the ACK, and if in FIN_WAIT_1, conditionally move to FIN_WAIT_2
      ReceivedAck (packet, tcpHeader);
      if (m_state == FIN_WAIT_1 && m_txBuffer->Size () == 0
          && tcpHeader.GetAckNumber () == m_tcb->m_highTxMark + SequenceNumber32 (1))
        { // This ACK corresponds to the FIN sent
          NS_LOG_DEBUG ("FIN_WAIT_1 -> FIN_WAIT_2");
          m_state = FIN_WAIT_2;
        }
    }
  else if (tcpflags == TcpHeader::FIN || tcpflags == (TcpHeader::FIN | TcpHeader::ACK))
    { // Got FIN, respond with ACK and move to next state
      if (tcpflags & TcpHeader::ACK)
        { // Process the ACK first
          ReceivedAck (packet, tcpHeader);
        }
      m_rxBuffer->SetFinSequence (tcpHeader.GetSequenceNumber ());
    }
  else if (tcpflags == TcpHeader::SYN || tcpflags == (TcpHeader::SYN | TcpHeader::ACK))
    { // Duplicated SYN or SYN+ACK, possibly due to spurious retransmission
      return;
    }
  else
    { // This is a RST or bad flags
      if (tcpflags != TcpHeader::RST)
        {
          NS_LOG_LOGIC ("Illegal flag " << TcpHeader::FlagsToString (tcpflags) <<
                        " received. Reset packet is sent.");
          SendRST ();
        }
      CloseAndNotify ();
      return;
    }

  // Check if the close responder sent an in-sequence FIN, if so, respond ACK
  if ((m_state == FIN_WAIT_1 || m_state == FIN_WAIT_2) && m_rxBuffer->Finished ())
    {
      if (m_state == FIN_WAIT_1)
        {
          NS_LOG_DEBUG ("FIN_WAIT_1 -> CLOSING");
          m_state = CLOSING;
          if (m_txBuffer->Size () == 0
              && tcpHeader.GetAckNumber () == m_tcb->m_highTxMark + SequenceNumber32 (1))
            { // This ACK corresponds to the FIN sent
              TimeWait ();
            }
        }
      else if (m_state == FIN_WAIT_2)
        {
          TimeWait ();
        }
      SendEmptyPacket (TcpHeader::ACK);
      if (!m_tcpParams->m_shutdownRecv)
        {
          NotifyDataRecv ();
        }
    }
}

/* Received a packet upon CLOSING */
void
TcpSocketBase::ProcessClosing (Ptr<Packet> packet, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Extract the flags. PSH and URG are not honoured.
  uint8_t tcpflags = tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG);

  if (tcpflags == TcpHeader::ACK)
    {
      if (tcpHeader.GetSequenceNumber () == m_rxBuffer->NextRxSequence ())
        { // This ACK corresponds to the FIN sent
          TimeWait ();
        }
    }
  else
    { // CLOSING state means simultaneous close, i.e. no one is sending data to
      // anyone. If anything other than ACK is received, respond with a reset.
      if (tcpflags == TcpHeader::FIN || tcpflags == (TcpHeader::FIN | TcpHeader::ACK))
        { // FIN from the peer as well. We can close immediately.
          SendEmptyPacket (TcpHeader::ACK);
        }
      else if (tcpflags != TcpHeader::RST)
        { // Receive of SYN or SYN+ACK or bad flags or pure data
          NS_LOG_LOGIC ("Illegal flag " << TcpHeader::FlagsToString (tcpflags) << " received. Reset packet is sent.");
          SendRST ();
        }
      CloseAndNotify ();
    }
}

/* Received a packet upon LAST_ACK */
void
TcpSocketBase::ProcessLastAck (Ptr<Packet> packet, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Extract the flags. PSH and URG are not honoured.
  uint8_t tcpflags = tcpHeader.GetFlags () & ~(TcpHeader::PSH | TcpHeader::URG);

  if (tcpflags == 0)
    {
      ReceivedData (packet, tcpHeader);
    }
  else if (tcpflags == TcpHeader::ACK)
    {
      if (tcpHeader.GetSequenceNumber () == m_rxBuffer->NextRxSequence ())
        { // This ACK corresponds to the FIN sent. This socket closed peacefully.
          CloseAndNotify ();
        }
    }
  else if (tcpflags == TcpHeader::FIN)
    { // Received FIN again, the peer probably lost the FIN+ACK
      SendEmptyPacket (TcpHeader::FIN | TcpHeader::ACK);
    }
  else if (tcpflags == (TcpHeader::FIN | TcpHeader::ACK) || tcpflags == TcpHeader::RST)
    {
      CloseAndNotify ();
    }
  else
    { // Received a SYN or SYN+ACK or bad flags
      NS_LOG_LOGIC ("Illegal flag " << TcpHeader::FlagsToString (tcpflags) << " received. Reset packet is sent.");
      SendRST ();
      CloseAndNotify ();
    }
}

/* Peer sent me a FIN. Remember its sequence in rx buffer. */
void
TcpSocketBase::PeerClose (Ptr<Packet> p, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);

  // Ignore all out of range packets
  if (tcpHeader.GetSequenceNumber () < m_rxBuffer->NextRxSequence ()
      || tcpHeader.GetSequenceNumber () > m_rxBuffer->MaxRxSequence ())
    {
      return;
    }
  // For any case, remember the FIN position in rx buffer first
  m_rxBuffer->SetFinSequence (tcpHeader.GetSequenceNumber () + SequenceNumber32 (p->GetSize ()));
  NS_LOG_LOGIC ("Accepted FIN at seq " << tcpHeader.GetSequenceNumber () + SequenceNumber32 (p->GetSize ()));
  // If there is any piggybacked data, process it
  if (p->GetSize ())
    {
      ReceivedData (p, tcpHeader);
    }
  // Return if FIN is out of sequence, otherwise move to CLOSE_WAIT state by DoPeerClose
  if (!m_rxBuffer->Finished ())
    {
      return;
    }

  // Simultaneous close: Application invoked Close() when we are processing this FIN packet
  if (m_state == FIN_WAIT_1)
    {
      NS_LOG_DEBUG ("FIN_WAIT_1 -> CLOSING");
      m_state = CLOSING;
      return;
    }

  DoPeerClose (); // Change state, respond with ACK
}

/* Received a in-sequence FIN. Close down this socket. */
void
TcpSocketBase::DoPeerClose (void)
{
  NS_ASSERT (m_state == ESTABLISHED || m_state == SYN_RCVD);

  // Move the state to CLOSE_WAIT
  NS_LOG_DEBUG (TcpStateName[m_state] << " -> CLOSE_WAIT");
  m_state = CLOSE_WAIT;

  if (!m_tcpParams->m_closeNotified)
    {
      // The normal behaviour for an application is that, when the peer sent a in-sequence
      // FIN, the app should prepare to close. The app has two choices at this point: either
      // respond with ShutdownSend() call to declare that it has nothing more to send and
      // the socket can be closed immediately; or remember the peer's close request, wait
      // until all its existing data are pushed into the TCP socket, then call Close()
      // explicitly.
      NS_LOG_LOGIC ("TCP " << this << " calling NotifyNormalClose");
      NotifyNormalClose ();
      m_tcpParams->m_closeNotified = true;
    }
  if (m_tcpParams->m_shutdownSend)
    { // The application declares that it would not sent any more, close this socket
      Close ();
    }
  else
    { // Need to ack, the application will close later
      SendEmptyPacket (TcpHeader::ACK);
    }
  if (m_state == LAST_ACK)
    {
      NS_LOG_LOGIC ("TcpSocketBase " << this << " scheduling LATO1");
      Time lastRto = m_rtt->GetEstimate () + Max (m_tcpParams->m_clockGranularity, m_rtt->GetVariation () * 4);
      m_lastAckEvent = Simulator::Schedule (lastRto, &TcpSocketBase::LastAckTimeout, this);
    }
}

/* Kill this socket. This is a callback function configured to m_endpoint in
   SetupCallback(), invoked when the endpoint is destroyed. */
void
TcpSocketBase::Destroy (void)
{
  NS_LOG_FUNCTION (this);
  m_endPoint = 0;
  if (m_tcp != 0)
    {
      m_tcp->RemoveSocket (this);
    }
  NS_LOG_LOGIC (this << " Cancelled ReTxTimeout event which was set to expire at " <<
                (Simulator::Now () + Simulator::GetDelayLeft (m_retxEvent)).GetSeconds ());
  CancelAllTimers ();
}

/* Kill this socket. This is a callback function configured to m_endpoint in
   SetupCallback(), invoked when the endpoint is destroyed. */
void
TcpSocketBase::Destroy6 (void)
{
  NS_LOG_FUNCTION (this);
  m_endPoint6 = 0;
  if (m_tcp != 0)
    {
      m_tcp->RemoveSocket(this);
    }
  NS_LOG_LOGIC (this << " Cancelled ReTxTimeout event which was set to expire at " <<
                (Simulator::Now () + Simulator::GetDelayLeft (m_retxEvent)).GetSeconds ());
  CancelAllTimers ();
}

void
TcpSocketBase::GenerateEmptyPacketHeader(TcpHeader& header, uint8_t flags)
{
  NS_LOG_FUNCTION (this << TcpHeader::FlagsToString(flags));

  SequenceNumber32 s = m_tcb->m_nextTxSequence;

  if (flags & TcpHeader::FIN)
    {
      flags |= TcpHeader::ACK;
    }
  else if (m_state == FIN_WAIT_1 || m_state == LAST_ACK || m_state == CLOSING)
    {
      ++s;
    }

  header.SetFlags (flags);
  header.SetSequenceNumber (s);

  if(flags & TcpHeader::ACK)
  {
    header.SetAckNumber (m_rxBuffer->NextRxSequence ());
  }

//  header.SetAckNumber (m_rxBuffer->NextRxSequence ());
  NS_LOG_DEBUG(this << " endpoint=" << m_endPoint);
  if (m_endPoint != 0)
    {
      header.SetSourcePort (m_endPoint->GetLocalPort ());
      header.SetDestinationPort (m_endPoint->GetPeerPort ());
    }
  else
    {
      NS_ASSERT(m_endPoint6 != 0);
      header.SetSourcePort (m_endPoint6->GetLocalPort ());
      header.SetDestinationPort (m_endPoint6->GetPeerPort ());
    }

  // Hong Jiaming: originally is just header.SetWindowSize (AdvertisedWindowSize ());
  if(flags & TcpHeader::SYN){
    header.SetWindowSize (AdvertisedWindowSize (false));
  }
  else{
    header.SetWindowSize (AdvertisedWindowSize ());
  }
}


void
TcpSocketBase::SendPacket(TcpHeader header, Ptr<Packet> p)
{
  NS_LOG_LOGIC ("Send packet via TcpL4Protocol with flags");
  //std::cout << "Hong Jiaming TcpSocketBase::SendPacket:\n"<< header.GetWindowSize() << " " << AdvertisedWindowSize () << std::endl;
  // NS_ASSERT(header.GetWindowSize() == AdvertisedWindowSize ()); // Hong Jiaming: original code. Bellow is a better way to solve bug
  NS_ASSERT(header.GetWindowSize() == AdvertisedWindowSize (!(header.GetFlags() & TcpHeader::SYN)));
  /*
   * Add tags for each socket option.
   * Note that currently the socket adds both IPv4 tag and IPv6 tag
   * if both options are set. Once the packet got to layer three, only
   * the corresponding tags will be read.
   */
  if (GetIpTos ())
    {
      SocketIpTosTag ipTosTag;
      ipTosTag.SetTos (GetIpTos ());
      p->AddPacketTag (ipTosTag);
    }

  if (IsManualIpv6Tclass ())
    {
      SocketIpv6TclassTag ipTclassTag;
      ipTclassTag.SetTclass (GetIpv6Tclass ());
      p->AddPacketTag (ipTclassTag);
    }

  if (IsManualIpTtl ())
    {
      SocketIpTtlTag ipTtlTag;
      ipTtlTag.SetTtl (GetIpTtl ());
      p->AddPacketTag (ipTtlTag);
    }

  if (IsManualIpv6HopLimit ())
    {
      SocketIpv6HopLimitTag ipHopLimitTag;
      ipHopLimitTag.SetHopLimit (GetIpv6HopLimit ());
      p->AddPacketTag (ipHopLimitTag);
    }

  uint8_t priority = GetPriority ();
  if (priority)
  {
    SocketPriorityTag priorityTag;
    priorityTag.SetPriority (priority);
    p->ReplacePacketTag (priorityTag);
  }

  AddOptions (header);

  if (m_endPoint == 0 && m_endPoint6 == 0)
    {
      NS_LOG_WARN ("Failed to send empty packet due to null endpoint");
      return;
    }

  m_txTrace (p, header, this);

  if (m_endPoint != 0)
    {
      m_tcp->SendPacket (p, header, m_endPoint->GetLocalAddress (),
                         m_endPoint->GetPeerAddress (), m_boundnetdevice);
    }
  else
    {
      NS_ASSERT(m_endPoint6 != 0);
      m_tcp->SendPacket (p, header, m_endPoint6->GetLocalAddress (),
                         m_endPoint6->GetPeerAddress (), m_boundnetdevice);
    }

  // std::cout << "Hong Jiaming 20.1: m_highTxAck == " << m_highTxAck << "header.GetAckNumber () == " << header.GetAckNumber ()
  //           << ", (header.GetFlags() & TcpHeader::ACK) == " << (header.GetFlags() & TcpHeader::ACK)
  //           << ", !m_delAckEvent.IsExpired() == " << !m_delAckEvent.IsExpired() << std::endl;
  if ((header.GetFlags() & TcpHeader::ACK) != 0 && m_delAckEvent.IsExpired()) // Hong Jiaming: modified by Hong Jiaming
  // if ((header.GetFlags() & TcpHeader::ACK) && !m_delAckEvent.IsExpired())// Hong Jiaming: This is original code
    { // If sending an ACK, cancel the delayed ACK as well
      m_delAckEvent.Cancel ();
      m_delAckCount = 0;

      if (m_highTxAck < header.GetAckNumber ())
      {
        m_highTxAck = header.GetAckNumber ();
      }
    }
}

/* Send an empty packet with specified TCP flags
TODO pass on a sequence number ?
*/
void
TcpSocketBase::SendEmptyPacket (uint8_t flags)
{
    TcpHeader header;
    GenerateEmptyPacketHeader(header, flags);
    SendEmptyPacket(header);
}

void
TcpSocketBase::SendEmptyPacket (TcpHeader& header)
{
//  NS_LOG_FUNCTION (this << (uint32_t)flags);
  NS_LOG_FUNCTION (this << header);
  Ptr<Packet> p = Create<Packet> ();

  //std::cout << "hehe 1: " << header.GetWindowSize() << std::endl;
  if (m_endPoint == 0 && m_endPoint6 == 0)
    {
      NS_LOG_WARN ("Failed to send empty packet due to null endpoint");
      return;
    }

  // RFC 6298, clause 2.4
  // TODO GetRTO
  m_rto = Max (m_rtt->GetEstimate () + Max (m_tcpParams->m_clockGranularity, m_rtt->GetVariation () * 4), m_tcpParams->m_minRto);

  uint16_t windowSize = AdvertisedWindowSize ();
  uint8_t flags = header.GetFlags();
  bool hasSyn = flags & TcpHeader::SYN;
  bool hasFin = flags & TcpHeader::FIN;
  bool isAck = flags == TcpHeader::ACK;
  if (hasSyn)
    {
      if (m_tcpParams->m_winScalingEnabled)
        { // The window scaling option is set only on SYN packets
          //std::cout << "TcpSocketBase::SendEmptyPacket(): befroe m_rcvWindShift get modified in AddOptionWScale()\n AdvertisedWindowSize(false) == " << AdvertisedWindowSize(false) << std::endl;
          AddOptionWScale (header);
          //std::cout << "TcpSocketBase::SendEmptyPacket(): after m_rcvWindShift is modified in AddOptionWScale()\n AdvertisedWindowSize(false) == " << AdvertisedWindowSize(false) << std::endl;
        }

      if (m_synCount == 0)
        { // No more connection retries, give up
          NS_LOG_LOGIC ("Connection failed.");
          m_rtt->Reset (); //According to recommendation -> RFC 6298
          CloseAndNotify ();
          return;
        }
      else
        { // Exponential backoff of connection time out
          int backoffCount = 0x1 << (m_tcpParams->m_synRetries - m_synCount);
          m_rto = m_tcpParams->m_cnTimeout * backoffCount;
          m_synCount--;
        }

      SequenceNumber32 s = header.GetSequenceNumber();
      if (m_tcpParams->m_synRetries - 1 == m_synCount)
        {
          UpdateRttHistory (s, 0, false);
        }
      else
        { // This is SYN retransmission
          UpdateRttHistory (s, 0, true);
        }

      // Hong Jiaming: scale	indicate if the window should be scaled. True for almost all cases, except when we are sending a SYN
      //std::cout << "hehe 2: " << header.GetWindowSize() << std::endl;
      windowSize = AdvertisedWindowSize (false);
      //std::cout << "hehe 3: " << header.GetWindowSize() << std::endl;

    }

    header.SetWindowSize (windowSize);
    //std::cout<< "TcpSocketBase::SendEmptyPacket: hasSyn == "<<hasSyn<< std::endl;
    //std::cout << "hehe 4: " << header.GetWindowSize() << std::endl;
    //std::cout<< "TcpSocketBase::SendEmptyPacket: next is SendPacket(header, p)"<<std::endl;
    SendPacket(header, p);
    //std::cout<< "TcpSocketBase::SendEmptyPacket: just called SendPacket(header, p)\n"<<std::endl;

  if (m_retxEvent.IsExpired () && (hasSyn || hasFin) && !isAck )
    { // Retransmit SYN / SYN+ACK / FIN / FIN+ACK to guard against lost
      NS_LOG_LOGIC ("Schedule retransmission timeout at time "
                    << Simulator::Now ().GetSeconds () << " to expire at time "
                    << (Simulator::Now () + m_rto.Get ()).GetSeconds ());
      m_retxEvent = Simulator::Schedule (m_rto, (void (TcpSocketBase::*)(uint8_t ))&TcpSocketBase::SendEmptyPacket, this, header.GetFlags());
    }
}

/* This function closes the endpoint completely. Called upon RST_TX action. */
void
TcpSocketBase::SendRST (void)
{
  NS_LOG_FUNCTION (this);
  SendEmptyPacket (TcpHeader::RST);
  NotifyErrorClose ();
  DeallocateEndPoint ();
}

/* Deallocate the end point and cancel all the timers */
void
TcpSocketBase::DeallocateEndPoint (void)
{
  if (m_endPoint != 0)
    {
      CancelAllTimers ();
      m_endPoint->SetDestroyCallback (MakeNullCallback<void> ());
      m_tcp->DeAllocate (m_endPoint);
      m_endPoint = 0;
      m_tcp->RemoveSocket (this);
    }
  else if (m_endPoint6 != 0)
    {
      CancelAllTimers ();
      m_endPoint6->SetDestroyCallback (MakeNullCallback<void> ());
      m_tcp->DeAllocate (m_endPoint6);
      m_endPoint6 = 0;
      m_tcp->RemoveSocket (this);
    }
}

/* Configure the endpoint to a local address. Called by Connect() if Bind() didn't specify one. */
int
TcpSocketBase::SetupEndpoint ()
{
  NS_LOG_FUNCTION (this);
  Ptr<Ipv4> ipv4 = m_node->GetObject<Ipv4> ();
  NS_ASSERT (ipv4 != 0);
  if (ipv4->GetRoutingProtocol () == 0)
    {
      NS_FATAL_ERROR ("No Ipv4RoutingProtocol in the node");
    }
  // Create a dummy packet, then ask the routing function for the best output
  // interface's address
  Ipv4Header header;
  header.SetDestination (m_endPoint->GetPeerAddress ());
  Socket::SocketErrno errno_;
  Ptr<Ipv4Route> route;
  // Ptr<NetDevice> oif = nullptr; //!?!
  Ptr<NetDevice> oif = m_boundnetdevice; // Hong Jiaming: In setup, m_boundnetdevice is wrong!?!
  ////*******//////////////// Hong Jiaming1: Just for debug
    //std::cout << "---------Hong Jiaming 1:\n Check routing by dummy packet From: " << m_node->GetObject<Ipv4>()->GetAddress(1,0).GetLocal()
              //<< " To: " << m_endPoint->GetPeerAddress () << " route == " << route
              //<< " oif == " << oif << " endpoint == " << m_endPoint << std::endl;
  //////*******////////////////
  route = ipv4->GetRoutingProtocol ()->RouteOutput (Ptr<Packet> (), header, oif, errno_);
  //std::cout << "---------Hong Jiaming 2:\n Check end " << std::endl;

  if (route == 0)
    {
      NS_LOG_LOGIC ("Route to " << m_endPoint->GetPeerAddress () << " does not exist");
      NS_LOG_ERROR (errno_);
      m_errno = errno_;
      return -1;
    }
  NS_LOG_LOGIC ("Route exists");
  m_endPoint->SetLocalAddress (route->GetSource ());
  return 0;
}

int
TcpSocketBase::SetupEndpoint6 ()
{
  NS_LOG_FUNCTION (this);
  Ptr<Ipv6L3Protocol> ipv6 = m_node->GetObject<Ipv6L3Protocol> ();
  NS_ASSERT (ipv6 != 0);
  if (ipv6->GetRoutingProtocol () == 0)
    {
      NS_FATAL_ERROR ("No Ipv6RoutingProtocol in the node");
    }
  // Create a dummy packet, then ask the routing function for the best output
  // interface's address
  Ipv6Header header;
  header.SetDestinationAddress (m_endPoint6->GetPeerAddress ());
  Socket::SocketErrno errno_;
  Ptr<Ipv6Route> route;
  Ptr<NetDevice> oif = m_boundnetdevice;
  route = ipv6->GetRoutingProtocol ()->RouteOutput (Ptr<Packet> (), header, oif, errno_);
  if (route == 0)
    {
      NS_LOG_LOGIC ("Route to " << m_endPoint6->GetPeerAddress () << " does not exist");
      NS_LOG_ERROR (errno_);
      m_errno = errno_;
      return -1;
    }
  NS_LOG_LOGIC ("Route exists");
  m_endPoint6->SetLocalAddress (route->GetSource ());
  return 0;
}

/* This function is called only if a SYN received in LISTEN state. After
   TcpSocketBase cloned, allocate a new end point to handle the incoming
   connection and send a SYN+ACK to complete the handshake. */
void
TcpSocketBase::CompleteFork (Ptr<Packet> p, const TcpHeader& h,
                             const Address& fromAddress, const Address& toAddress)
{
  NS_LOG_FUNCTION (this);

  // Get port and address from peer (connecting host)
  if (InetSocketAddress::IsMatchingType (toAddress))
    {
      m_endPoint = m_tcp->Allocate (InetSocketAddress::ConvertFrom (toAddress).GetIpv4 (),
                                    InetSocketAddress::ConvertFrom (toAddress).GetPort (),
                                    InetSocketAddress::ConvertFrom (fromAddress).GetIpv4 (),
                                    InetSocketAddress::ConvertFrom (fromAddress).GetPort ());
      m_endPoint6 = 0;
      NS_ASSERT(m_endPoint);
    }
  else if (Inet6SocketAddress::IsMatchingType (toAddress))
    {
      m_endPoint6 = m_tcp->Allocate6 (Inet6SocketAddress::ConvertFrom (toAddress).GetIpv6 (),
                                      Inet6SocketAddress::ConvertFrom (toAddress).GetPort (),
                                      Inet6SocketAddress::ConvertFrom (fromAddress).GetIpv6 (),
                                      Inet6SocketAddress::ConvertFrom (fromAddress).GetPort ());
      m_endPoint = 0;
      NS_ASSERT(m_endPoint6);
    }
  bool result = m_tcp->AddSocket (this);
  if(!result)
  {
    NS_LOG_DEBUG("Can't add socket: already registered ? Can be because of mptcp");
  }

  // Change the cloned socket from LISTEN state to SYN_RCVD
  NS_LOG_DEBUG ("LISTEN -> SYN_RCVD");
  m_state = SYN_RCVD;
  m_synCount = m_tcpParams->m_synRetries;
  m_dataRetrCount = m_tcpParams->m_dataRetries;
  SetupCallback ();
  // Set the sequence number and send SYN+ACK
  m_rxBuffer->SetNextRxSequence (h.GetSequenceNumber () + SequenceNumber32 (1));

  SendEmptyPacket (TcpHeader::SYN | TcpHeader::ACK);
}

void
TcpSocketBase::ConnectionSucceeded ()
{ // Wrapper to protected function NotifyConnectionSucceeded() so that it can
  // be called as a scheduled event
  NotifyConnectionSucceeded ();
  // The if-block below was moved from ProcessSynSent() to here because we need
  // to invoke the NotifySend() only after NotifyConnectionSucceeded() to
  // reflect the behaviour in the real world.
  if (GetTxAvailable () > 0)
    {
      NotifySend (GetTxAvailable ());
    }
}

/* Extract at most maxSize bytes from the TxBuffer at sequence seq, add the
    TCP header, and send to TcpL4Protocol */
uint32_t
TcpSocketBase::SendDataPacket (SequenceNumber32 seq, uint32_t maxSize, bool withAck)
{
    TcpHeader header;
    GenerateEmptyPacketHeader(header, withAck ? TcpHeader::ACK : 0);
    return SendDataPacket(header, seq, maxSize);
}


uint32_t
TcpSocketBase::SendDataPacket (TcpHeader& header, SequenceNumber32 seq, uint32_t maxSize)
{
  NS_LOG_FUNCTION (this << seq << maxSize);

  bool isRetransmission = false;
  if (seq != m_tcb->m_highTxMark)
    {
      isRetransmission = true;
    }

  Ptr<Packet> p = m_txBuffer->CopyFromSequence (maxSize, seq);
  uint32_t sz = p->GetSize (); // Size of packet
  uint32_t remainingData = m_txBuffer->SizeFromSequence (seq + SequenceNumber32 (sz));

  if (m_tcpParams->m_closeOnEmpty && (remainingData == 0))
    {
      header.SetFlags(TcpHeader::FIN | header.GetFlags());
      if (m_state == ESTABLISHED)
        { // On active close: I am the first one to send FIN
          NS_LOG_DEBUG ("ESTABLISHED -> FIN_WAIT_1");
          m_state = FIN_WAIT_1;
        }
      else if (m_state == CLOSE_WAIT)
        { // On passive close: Peer sent me FIN already
          NS_LOG_DEBUG ("CLOSE_WAIT -> LAST_ACK");
          m_state = LAST_ACK;
        }
    }

  header.SetSequenceNumber (seq);

  if (m_retxEvent.IsExpired ())
    {
      // Schedules retransmit timeout. If this is a retransmission, double the timer

      if (isRetransmission)
        { // This is a retransmit
          // RFC 6298, clause 2.5
          Time doubledRto = m_rto + m_rto;
          m_rto = Min (doubledRto, Time::FromDouble (60,  Time::S));
          NS_LOG_DEBUG (this << "Hong Jiaming 82: m_rto == " << m_rto << " addr == " << &m_rto);
        }
      // Schedules retransmit
      NS_LOG_LOGIC (this << " SendDataPacket Schedule ReTxTimeout at time " <<
                    Simulator::Now ().GetSeconds () << " to expire at time " <<
                    (Simulator::Now () + m_rto.Get ()).GetSeconds () );
      m_retxEvent = Simulator::Schedule (m_rto, &TcpSocketBase::ReTxTimeout, this);
    }

  //std::cout<< "TcpSocketBase::SendDataPacket: next is SendPacket(header, p)"<<std::endl;
  SendPacket(header, p);
  //std::cout<< "TcpSocketBase::SendDataPacket: just called SendPacket(header, p)\n"<<std::endl;

  UpdateRttHistory (seq, sz, isRetransmission);

  // Notify the application of the data being sent unless this is a retransmit
  if (seq + sz > m_tcb->m_highTxMark)
    {
      Simulator::ScheduleNow (&TcpSocketBase::NotifyDataSent, this,
                             (seq + sz - m_tcb->m_highTxMark.Get ()));
    }
  // Update highTxMark
  m_tcb->m_highTxMark = std::max (seq + sz, m_tcb->m_highTxMark.Get ());
  return sz;
}

void
TcpSocketBase::UpdateRttHistory (const SequenceNumber32 &seq, uint32_t sz,
                                 bool isRetransmission)
{
  NS_LOG_FUNCTION (this);

  // update the history of sequence numbers used to calculate the RTT
  if (isRetransmission == false)
    { // This is the next expected one, just log at end
      m_history.push_back (RttHistory (seq, sz, Simulator::Now ()));
    }
  else
    { // This is a retransmit, find in list and mark as re-tx
      for (RttHistory_t::iterator i = m_history.begin (); i != m_history.end (); ++i)
        {
          if ((seq >= i->seq) && (seq < (i->seq + SequenceNumber32 (i->count))))
            { // Found it
              i->retx = true;
              i->count = ((seq + SequenceNumber32 (sz)) - i->seq); // And update count in hist
              break;
            }
        }
    }
}

bool TcpSocketBase::CanSendPendingData (uint32_t dataToSend)
{
  NS_LOG_FUNCTION (this);
  uint32_t w = AvailableWindow (); // Get available window size
  // Stop sending if we need to wait for a larger Tx window (prevent silly window syndrome)
  if (w < m_tcb->m_segmentSize && dataToSend > w)
  {
    NS_LOG_LOGIC ("Preventing Silly Window Syndrome. Wait to send.");
    return false; // No more
  }
  // Nagle's algorithm (RFC896): Hold off sending if there is unacked data
  // in the buffer and the amount of data to send is less than one segment
  if (!m_tcpParams->m_noDelay && UnAckDataCount () > 0
      && dataToSend < m_tcb->m_segmentSize)
  {
     std::cout << "Hong Jiaming 74: It seems that code never goes to here." << std::endl;
     NS_LOG_LOGIC ("Invoking Nagle's algorithm. Wait to send.");
    return false;
  }
  return w > 0;
}

/* Send as much pending data as possible according to the Tx window. Note that
 *  this function did not implement the PSH flag
 */
bool
TcpSocketBase::SendPendingData (bool withAck)
{
  NS_LOG_FUNCTION (this << withAck << " in state " << TcpStateName[m_state]);
  if (m_txBuffer->Size () == 0)
    {
      NS_LOG_DEBUG("Nothing to send");
      return false;                           // Nothing to send
    }
  if (m_endPoint == 0 && m_endPoint6 == 0)
    {
      NS_LOG_INFO ("TcpSocketBase::SendPendingData: No endpoint; m_shutdownSend=" << m_tcpParams->m_shutdownSend);
      return false; // Is this the right way to handle this condition?
    }
  uint32_t nPacketsSent = 0;
  while (m_txBuffer->SizeFromSequence (m_tcb->m_nextTxSequence))
    {
      uint32_t w = AvailableWindow (); // Get available window size
      // Stop sending if we need to wait for a larger Tx window (prevent silly window syndrome)
      if (!CanSendPendingData(m_txBuffer->SizeFromSequence(m_tcb->m_nextTxSequence)))
        {
          break; // No more
        }

      NS_LOG_LOGIC ("TcpSocketBase " << this << " SendPendingData" <<
                    " w " << w <<
                    " rxwin " << m_rWnd <<
                    " segsize " << m_tcb->m_segmentSize <<
                    " highestRxAck " << m_txBuffer->HeadSequence () <<
                    " TxBufferSize=" << m_txBuffer->Size () <<
                    " pd->SizeFromSequence( " << m_tcb->m_nextTxSequence << ")="
                    << m_txBuffer->SizeFromSequence (m_tcb->m_nextTxSequence));
      NS_LOG_DEBUG ("Window: " << w <<
                    " cWnd: " << m_tcb->m_cWnd <<
                    " unAck: " << UnAckDataCount ());

      uint32_t s = std::min (w, m_tcb->m_segmentSize);  // Send no more than window
      uint32_t sz = SendDataPacket (m_tcb->m_nextTxSequence, s, withAck);
      nPacketsSent++;                             // Count sent this loop
      m_tcb->m_nextTxSequence += sz;                     // Advance next tx sequence
    }
  if (nPacketsSent > 0)
    {
      NS_LOG_DEBUG ("SendPendingData sent " << nPacketsSent << " segments");
    }
  return (nPacketsSent > 0);
}

uint32_t
TcpSocketBase::UnAckDataCount () const
{
  NS_LOG_FUNCTION (this);
  return m_tcb->m_nextTxSequence.Get () - m_txBuffer->HeadSequence ();
}

uint32_t
TcpSocketBase::BytesInFlight ()
{
  NS_LOG_FUNCTION (this);
  // Previous (see bug 1783):
  // uint32_t bytesInFlight = m_highTxMark.Get () - m_txBuffer->HeadSequence ();
  // RFC 4898 page 23
  // PipeSize=SND.NXT-SND.UNA+(retransmits-dupacks)*CurMSS

  // flightSize == UnAckDataCount (), but we avoid the call to save log lines
  uint32_t flightSize = m_tcb->m_nextTxSequence.Get () - m_txBuffer->HeadSequence ();
  uint32_t duplicatedSize;
  uint32_t bytesInFlight;

  if (m_retransOut > m_dupAckCount)
    {
      duplicatedSize = (m_retransOut - m_dupAckCount)*m_tcb->m_segmentSize;
      bytesInFlight = flightSize + duplicatedSize;
    }
  else
    {
      duplicatedSize = (m_dupAckCount - m_retransOut)*m_tcb->m_segmentSize;
      bytesInFlight = duplicatedSize > flightSize ? 0 : flightSize - duplicatedSize;
    }

  // m_bytesInFlight is traced; avoid useless assignments which would fire
  // fruitlessly the callback
  if (m_bytesInFlight != bytesInFlight)
    {
      m_bytesInFlight = bytesInFlight;
    }

  return bytesInFlight;
}

uint32_t
TcpSocketBase::Window (void) const
{
  NS_LOG_FUNCTION (this);
  return std::min (m_rWnd.Get (), m_tcb->m_cWnd.Get ());
}

/*
 * In Fast Recovery, RFC says that for each duplicate ACK the implementation
 * should increment cWnd by one segment size. The reasoning behind this
 * temporarily inflation of cwnd is to be able to send more segments out for
 * each incoming duplicate-ACK (which indicates that another segment made it
 * to the other side). This is necessary because TCP's sliding window is stuck
 * and will not slide until the first non-duplicate ACK comes back. As soon as
 * the first non-duplicate ACK comes back cwnd is set back to ssthresh and the
 * window continues sliding in normal congestion-avoidance mode. The implementation
 * of TCP in Linux kernel avoids this "shamanism" (they're so funny in commenting
 * their code) by improving the estimate of the in-flight packet. In RFC and old ns-3,
 * the calculus is:
 *
 *    AvailableWindow = cWnd - (SND.NXT - SND.UNA)
 *
 * example: cWnd = 10, SND.NXT = 20, SND.UNA = 10.
 * You receive 3 ACKs for 10. When receiving the third, you set cWnd to 13, and so:
 *
 *    AvailableWindow = 13 - (20 - 10) = 3
 *
 * and 3 packets could be sent. For each additional DUPACK, cWnd is
 * incremented by 1 MSS, and one packet could be sent. When a full ACK is
 * received, cWnd goes back to the right value (which is the recalculated ssth).
 * In Linux [1], the calculus is:
 *
 *    AvailableWindow = cWnd - (SND.NXT-SND.UNA) - left_out + retrans_out
 *
 * What are these new values? retrans_out is the number of packet retransmitted, and
 *
 *    left_out = sacked_out + lost_out
 *
 * where sacked_out is the number of packets arrived at the received but not
 * acked. With SACK this is easy to obtain, but with DUPACK is easy too
 * (sacket_out=m_dupAckCount). lost_out is the only guessed value: with FACK,
 * which is the most conservative heuristic, you assume that all not SACKed
 * packets until the most forward SACK are lost. Since we have not SACK, NewReno
 * estimate could be used, which basically assumes that only one segment is
 * lost (classical Reno). If we are in recovery and a partial ACK arrives,
 * it means that one more packet has been lost.
 */
uint32_t
TcpSocketBase::AvailableWindow () const
{
  NS_LOG_FUNCTION_NOARGS ();
  uint32_t unack = UnAckDataCount (); // Number of outstanding bytes
  uint32_t win = Window ();           // Number of bytes allowed to be outstanding

  NS_LOG_DEBUG ("UnAckCount=" << unack << ", Win=" << win);
  return (win < unack) ? 0 : (win - unack);
}

uint16_t
TcpSocketBase::AdvertisedWindowSize (bool scale) const
{
  NS_LOG_FUNCTION (this << scale);
  uint32_t w = m_rxBuffer->MaxBufferSize ();
  //std::cout << "\nHong Jiaming: TcpSocketBase::AdvertisedWindowSize()\n MaxBufferSize: " << m_rxBuffer->MaxBufferSize () << " w >> m_rcvWindShift: " << (w >> m_rcvWindShift) << " m_maxWinSize: " << m_tcpParams->m_maxWinSize << " " << std::endl;
  //std::cout << "\nHong Jiaming: TcpSocketBase::AdvertisedWindowSize() is called: \n MaxBufferSize: " << m_rxBuffer->MaxBufferSize () << " w >> m_rcvWindShift: " << (w >> m_rcvWindShift) << " m_maxWinSize: " << m_tcpParams->m_maxWinSize << " m_rcvWindShift: " << (int)m_rcvWindShift << " scale: " << scale << std::endl;
  if (scale)
    {
      w >>= m_rcvWindShift;
    }
  if (w > m_tcpParams->m_maxWinSize)
    {
      w = m_tcpParams->m_maxWinSize;
      NS_LOG_WARN ("Adv window size truncated to " << m_tcpParams->m_maxWinSize << "; possibly to avoid overflow of the 16-bit integer");
    }
  NS_LOG_DEBUG ("Returning AdvertisedWindowSize of " << static_cast<uint16_t> (w));
  return static_cast<uint16_t> (w);
}

// Receipt of new packet, put into Rx buffer
void
TcpSocketBase::ReceivedData (Ptr<Packet> p, const TcpHeader& tcpHeader)
{
  NS_LOG_FUNCTION (this << tcpHeader);
//  NS_LOG_UNCOND ("Data segment, seq=" << tcpHeader.GetSequenceNumber () <<
//                " pkt size=" << p->GetSize () );

  // Put into Rx buffer
  SequenceNumber32 expectedSeq = m_rxBuffer->NextRxSequence ();
  if (!m_rxBuffer->Add (p, tcpHeader.GetSequenceNumber ()))
    { // Insert failed: No data or RX buffer full
      SendEmptyPacket (TcpHeader::ACK);
      return;
    }
  // Now send a new ACK packet acknowledging all received and delivered data
  if (m_rxBuffer->Size () > m_rxBuffer->Available () || m_rxBuffer->NextRxSequence () > expectedSeq + p->GetSize ())
    { // A gap exists in the buffer, or we filled a gap: Always ACK
      SendEmptyPacket (TcpHeader::ACK);
    }
  else
    { // In-sequence packet: ACK if delayed ack count allows
      if (++m_delAckCount >= m_tcpParams->m_delAckMaxCount)
        {
          m_delAckEvent.Cancel ();
          m_delAckCount = 0;
          SendEmptyPacket (TcpHeader::ACK);
        }
      else if (m_delAckEvent.IsExpired ())
        {
          m_delAckEvent = Simulator::Schedule (m_tcpParams->m_delAckTimeout,
                                               &TcpSocketBase::DelAckTimeout, this);
          NS_LOG_LOGIC (this << " scheduled delayed ACK at " <<
                        (Simulator::Now () + Simulator::GetDelayLeft (m_delAckEvent)).GetSeconds ());
        }
    }
  // Notify app to receive if necessary
  if (expectedSeq < m_rxBuffer->NextRxSequence ())
    { // NextRxSeq advanced, we have something to send to the app
      if (!m_tcpParams->m_shutdownRecv)
        {
          NotifyDataRecv ();
        }
      // Handle exceptions
      if (m_tcpParams->m_closeNotified)
        {
          NS_LOG_WARN ("Why TCP " << this << " got data after close notification?");
        }
      // If we received FIN before and now completed all "holes" in rx buffer,
      // invoke peer close procedure
      if (m_rxBuffer->Finished () && (tcpHeader.GetFlags () & TcpHeader::FIN) == 0)
        {
          DoPeerClose ();
        }
    }
}

/**
 * \brief Estimate the RTT
 *
 * Called by ForwardUp() to estimate RTT.
 *
 * \param tcpHeader TCP header for the incoming packet
 */
void
TcpSocketBase::EstimateRtt (const TcpHeader& tcpHeader)
{
  SequenceNumber32 ackSeq = tcpHeader.GetAckNumber ();
  Time m = Time (0.0);

  // m_history is the record of sent packet which are not acked yet
  // An ack has been received, calculate rtt and log this measurement
  // Note we use a linear search (O(n)) for this since for the common
  // case the ack'ed packet will be at the head of the list
  if (!m_history.empty ()){
    RttHistory& h = m_history.front ();
    if (!h.retx && ackSeq >= (h.seq + SequenceNumber32 (h.count))){ // Ok to use this sample
      if (m_tcpParams->m_timestampEnabled && tcpHeader.HasOption (TcpOption::TS)){
        Ptr<TcpOptionTS> ts;
        ts = DynamicCast<TcpOptionTS> (tcpHeader.GetOption (TcpOption::TS));
        // Kind of strange. RTT
        m = TcpOptionTS::ElapsedTimeFromTsValue (ts->GetEcho ());
//         std::cout << "Hong Jiaming 70 timeStamp = " << ts->GetTimestamp () << " echo = " << ts->GetEcho() << " rtt = " << 2*(ts->GetTimestamp() - ts->GetEcho()) << std::endl;
        // std::cout << "Hong Jiaming 71: m == " << m << std::endl;
      }
      else{
        m = Simulator::Now () - h.time; // Elapsed time
        // std::cout << "Hong Jiaming 72: m == " << m << std::endl;
      }
    }
  }

  // Now delete all ack history with seq <= ack
  while (!m_history.empty ()){
    RttHistory& h = m_history.front ();
    if ((h.seq + SequenceNumber32 (h.count)) > ackSeq){
      break; // Done removing
    }
    m_history.pop_front (); // Remove
  }

  if (!m.IsZero ())
    {
      m_rtt->Measurement (m);                // Log the measurement
      // RFC 6298, clause 2.4
      m_rto = Max (m_rtt->GetEstimate () + Max (m_tcpParams->m_clockGranularity, m_rtt->GetVariation () * 4), m_tcpParams->m_minRto);
      m_lastRtt = m_rtt->GetEstimate ();
      NS_LOG_FUNCTION (this << m_lastRtt);
    }
}

Time
TcpSocketBase::ComputeRTO() const
{
    return Max (m_rtt->GetEstimate () + Max (m_tcpParams->m_clockGranularity, m_rtt->GetVariation ()*4), m_tcpParams->m_minRto);
}

// Called by the ReceivedAck() when new ACK received and by ProcessSynRcvd()
// when the three-way handshake completed. This cancels retransmission timer
// and advances Tx window
void
TcpSocketBase::NewAck (const TcpHeader& header, bool resetRTO)
{
  SequenceNumber32 ack = header.GetAckNumber();

  NS_LOG_FUNCTION (this << ack);

  if (m_state != SYN_RCVD && resetRTO)
    { // Set RTO unless the ACK is received in SYN_RCVD state
      NS_LOG_LOGIC (this << " Cancelled ReTxTimeout event which was set to expire at " <<
                    (Simulator::Now () + Simulator::GetDelayLeft (m_retxEvent)).GetSeconds ());
      m_retxEvent.Cancel ();
      // On receiving a "New" ack we restart retransmission timer .. RFC 6298
      // RFC 6298, clause 2.4
      m_rto = ComputeRTO();

      NS_LOG_LOGIC (this << " Schedule ReTxTimeout at time " <<
                    Simulator::Now ().GetSeconds () << " to expire at time " <<
                    (Simulator::Now () + m_rto.Get ()).GetSeconds ());
      m_retxEvent = Simulator::Schedule (m_rto, &TcpSocketBase::ReTxTimeout, this);
    }
  if (m_rWnd.Get () == 0 && m_persistEvent.IsExpired ())
    { // Zero window: Enter persist state to send 1 byte to probe
      NS_LOG_LOGIC (this << "Enter zerowindow persist state");
      NS_LOG_LOGIC (this << "Cancelled ReTxTimeout event which was set to expire at " <<
                    (Simulator::Now () + Simulator::GetDelayLeft (m_retxEvent)).GetSeconds ());
      m_retxEvent.Cancel ();
      NS_LOG_LOGIC ("Schedule persist timeout at time " <<
                    Simulator::Now ().GetSeconds () << " to expire at time " <<
                    (Simulator::Now () + m_tcpParams->m_persistTimeout).GetSeconds ());
      m_persistEvent = Simulator::Schedule (m_tcpParams->m_persistTimeout, &TcpSocketBase::PersistTimeout, this);
      NS_ASSERT (m_tcpParams->m_persistTimeout == Simulator::GetDelayLeft (m_persistEvent));
    }
  // Note the highest ACK and tell app to send more
  NS_LOG_LOGIC ("TCP " << this << " NewAck " << ack <<
                " numberAck " << (ack - m_txBuffer->HeadSequence ())); // Number bytes ack'ed

  UpdateTxBuffer(ack);

  if (GetTxAvailable () > 0)
    {
      NotifySend (GetTxAvailable ());
    }
  if (ack > m_tcb->m_nextTxSequence)
    {
     m_tcb->m_nextTxSequence = ack; // If advanced
    }
  if (m_txBuffer->Size () == 0 && m_state != FIN_WAIT_1 && m_state != CLOSING)
    { // No retransmit timer if no data to retransmit
      NS_LOG_LOGIC (this << " Cancelled ReTxTimeout event which was set to expire at " <<
                    (Simulator::Now () + Simulator::GetDelayLeft (m_retxEvent)).GetSeconds ());
      m_retxEvent.Cancel ();
    }
}

void
TcpSocketBase::UpdateTxBuffer(SequenceNumber32 ack)
{
  NS_LOG_FUNCTION(this);
  m_txBuffer->DiscardUpTo (ack);
}

// Retransmit timeout
void
TcpSocketBase::ReTxTimeout ()
{
  NS_LOG_FUNCTION (this);
  NS_LOG_UNCOND("Time out!");
  NS_LOG_LOGIC (this << " ReTxTimeout Expired at time " << Simulator::Now ().GetSeconds ());
  //considered as loss then we update l_1r and l_2r
  this->set1r(this->get2r());
  this->set2r(0);

  // If erroneous timeout in closed/timed-wait state, just return
  if (m_state == CLOSED || m_state == TIME_WAIT)
    {
      return;
    }
  // If all data are received (non-closing socket and nothing to send), just return
  if (m_state <= ESTABLISHED && m_txBuffer->HeadSequence () >= m_tcb->m_highTxMark)
    {
      return;
    }

  m_recover = m_tcb->m_highTxMark;
  Retransmit ();
}

void
TcpSocketBase::DelAckTimeout (void)
{
  m_delAckCount = 0;
  SendEmptyPacket (TcpHeader::ACK);
}

void
TcpSocketBase::LastAckTimeout (void)
{
  NS_LOG_FUNCTION (this);

  m_lastAckEvent.Cancel ();
  if (m_state == LAST_ACK)
    {
      CloseAndNotify ();
    }
  if (!m_tcpParams->m_closeNotified)
    {
      m_tcpParams->m_closeNotified = true;
    }
}

// Send 1-byte data to probe for the window size at the receiver when
// the local knowledge tells that the receiver has zero window size
// C.f.: RFC793 p.42, RFC1112 sec.4.2.2.17
void
TcpSocketBase::PersistTimeout ()
{
  NS_LOG_LOGIC ("PersistTimeout expired at " << Simulator::Now ().GetSeconds ());
  m_tcpParams->m_persistTimeout = std::min (Seconds (60), Time (2 * m_tcpParams->m_persistTimeout)); // max persist timeout = 60s
  Ptr<Packet> p = m_txBuffer->CopyFromSequence (1, m_tcb->m_nextTxSequence);
  TcpHeader tcpHeader;
  GenerateEmptyPacketHeader(tcpHeader, 0);
  //std::cout<< "TcpSocketBase::PersistTimeout: next is SendPacket(tcpHeader, p)"<<std::endl;
  SendPacket(tcpHeader,p);
  //std::cout<< "TcpSocketBase::PersistTimeout: next is SendPacket(tcpHeader, p)\n"<<std::endl;

  NS_LOG_LOGIC ("Schedule persist timeout at time "
                << Simulator::Now ().GetSeconds () << " to expire at time "
                << (Simulator::Now () + m_tcpParams->m_persistTimeout).GetSeconds ());
  m_persistEvent = Simulator::Schedule (m_tcpParams->m_persistTimeout, &TcpSocketBase::PersistTimeout, this);
}

void
TcpSocketBase::Retransmit ()
{
  // If erroneous timeout in closed/timed-wait state, just return
  if (m_state == CLOSED || m_state == TIME_WAIT)
    {
      return;
    }
  // If all data are received (non-closing socket and nothing to send), just return
  if (m_state <= ESTABLISHED && m_txBuffer->HeadSequence () >= m_tcb->m_highTxMark)
    {
      return;
    }

  /*
   * When a TCP sender detects segment loss using the retransmission timer
   * and the given segment has not yet been resent by way of the
   * retransmission timer, the value of ssthresh MUST be set to no more
   * than the value given in equation (4):
   *
   *   ssthresh = max (FlightSize / 2, 2*SMSS)            (4)
   *
   * where, as discussed above, FlightSize is the amount of outstanding
   * data in the network.
   *
   * On the other hand, when a TCP sender detects segment loss using the
   * retransmission timer and the given segment has already been
   * retransmitted by way of the retransmission timer at least once, the
   * value of ssthresh is held constant.
   *
   * Conditions to decrement slow - start threshold are as follows:
   *
   * *) The TCP state should be less than disorder, which is nothing but open.
   * If we are entering into the loss state from the open state, we have not yet
   * reduced the slow - start threshold for the window of data. (Nat: Recovery?)
   * *) If we have entered the loss state with all the data pointed to by high_seq
   * acknowledged. Once again it means that in whatever state we are (other than
   * open state), all the data from the window that got us into the state, prior to
   * retransmission timer expiry, has been acknowledged. (Nat: How this can happen?)
   * *) If the above two conditions fail, we still have one more condition that can
   * demand reducing the slow - start threshold: If we are already in the loss state
   * and have not yet retransmitted anything. The condition may arise in case we
   * are not able to retransmit anything because of local congestion.
   */

  if (m_tcb->m_congState != TcpSocketState::CA_LOSS)
    {
      m_congestionControl->CongestionStateSet (m_tcb, TcpSocketState::CA_LOSS);
      m_tcb->m_congState = TcpSocketState::CA_LOSS;
      m_tcb->m_ssThresh = m_congestionControl->GetSsThresh (m_tcb, BytesInFlight ());
      m_tcb->m_cWnd = m_tcb->m_segmentSize;
    }

  m_tcb->m_nextTxSequence = m_txBuffer->HeadSequence (); // Restart from highest Ack
  m_dupAckCount = 0;

  NS_LOG_DEBUG ("RTO. Reset cwnd to " <<  m_tcb->m_cWnd << ", ssthresh to " <<
                m_tcb->m_ssThresh << ", restart from seqnum " << m_tcb->m_nextTxSequence);
  DoRetransmit ();                          // Retransmit the packet
}

void
TcpSocketBase::DoRetransmit ()
{
  NS_LOG_FUNCTION (this);
  // Retransmit SYN packet
  if (m_state == SYN_SENT)
    {
      if (m_synCount > 0)
        {
          SendEmptyPacket (TcpHeader::SYN);
        }
      else
        {
          NotifyConnectionFailed ();
        }
      return;
    }

  if (m_dataRetrCount == 0)
    {
      NS_LOG_INFO ("No more data retries available. Dropping connection");
      NotifyErrorClose ();
      DeallocateEndPoint ();
      return;
    }
  else
    {
      --m_dataRetrCount;
    }

  // Retransmit non-data packet: Only if in FIN_WAIT_1 or CLOSING state
  if (m_txBuffer->Size () == 0)
    {
      if (m_state == FIN_WAIT_1 || m_state == CLOSING)
        { // Must have lost FIN, re-send
          SendEmptyPacket (TcpHeader::FIN);
        }
      return;
    }
  // Retransmit a data packet: Call SendDataPacket
  NS_LOG_LOGIC ("TcpSocketBase " << this << " retxing seq " << m_txBuffer->HeadSequence ());
  uint32_t sz = SendDataPacket (m_txBuffer->HeadSequence (), GetSegSize(), true);
  ++m_retransOut;

  // In case of RTO, advance m_tcb->m_nextTxSequence
  m_tcb->m_nextTxSequence = std::max (m_tcb->m_nextTxSequence.Get (), m_txBuffer->HeadSequence () + sz);
  NS_LOG_DEBUG ("retxing seq " << m_txBuffer->HeadSequence ());
}

void
TcpSocketBase::CancelAllTimers ()
{
  m_retxEvent.Cancel ();
  m_persistEvent.Cancel ();
  m_delAckEvent.Cancel ();
  m_lastAckEvent.Cancel ();
  m_timewaitEvent.Cancel ();
  m_sendPendingDataEvent.Cancel ();
}

/* Move TCP to Time_Wait state and schedule a transition to Closed state */
void
TcpSocketBase::TimeWait ()
{
  NS_LOG_DEBUG (TcpStateName[m_state] << " -> TIME_WAIT");
  m_state = TIME_WAIT;
  CancelAllTimers ();
  // Move from TIME_WAIT to CLOSED after 2*MSL. Max segment lifetime is 2 min
  // according to RFC793, p.28
  m_timewaitEvent = Simulator::Schedule (Seconds (2 * m_tcpParams->m_msl),
                                         &TcpSocketBase::CloseAndNotify, this);
}

/* Below are the attribute get/set functions */

void TcpSocketBase::NotifyRcvBufferChange (uint32_t oldSize, uint32_t newSize)
{
  /* The size has (manually) increased. Actively inform the other end to prevent
   * stale zero-window states.
   */
  if (oldSize < newSize && m_connected)
  {
    SendEmptyPacket (TcpHeader::ACK);
  }
}

void TcpSocketBase::SetSndBufSize (uint32_t size)
{
  NS_LOG_FUNCTION (this << size);
  m_txBuffer->SetMaxBufferSize (size);
}

uint32_t TcpSocketBase::GetSndBufSize (void) const
{
  return m_txBuffer->MaxBufferSize ();
}

void TcpSocketBase::SetRcvBufSize (uint32_t size)
{
  NS_LOG_FUNCTION (this << size);
  uint32_t oldSize = GetRcvBufSize ();

  m_rxBuffer->SetMaxBufferSize (size);

  NotifyRcvBufferChange(oldSize, size);
}

uint32_t TcpSocketBase::GetRcvBufSize (void) const
{
  return m_rxBuffer->MaxBufferSize ();
}


void
TcpSocketBase::SetSegSize (uint32_t size)
{
  NS_LOG_FUNCTION (this << size);
  m_tcb->m_segmentSize = size;

  NS_ABORT_MSG_UNLESS (m_state == CLOSED, "Cannot change segment size dynamically.");
}

uint32_t
TcpSocketBase::GetSegSize (void) const
{
  return m_tcb->m_segmentSize;
}

bool
TcpSocketBase::IsTcpOptionAllowed(uint8_t kind) const
{
    NS_LOG_FUNCTION(this << (int)kind);

    switch(kind)
    {
      case TcpOption::TS:
        return m_tcpParams->m_timestampEnabled;
      case TcpOption::WINSCALE:
        return m_tcpParams->m_winScalingEnabled;
      case TcpOption::MPTCP:
        NS_LOG_INFO("MpTcp Active=" << m_tcpParams->m_mptcpEnabled);
        return m_tcpParams->m_mptcpEnabled;
      default:
        break;
    };
    return false;
}

void
TcpSocketBase::AddOptions (TcpHeader& header)
{
  NS_LOG_FUNCTION (this << header);

  if (m_tcpParams->m_timestampEnabled)
  {
    // std::cout << "Hong Jiaming 16. It should be here to add timestamp!" << std::endl;
    AddOptionTimestamp (header);
  }
}

void
TcpSocketBase::ProcessOptionWScale (const Ptr<const TcpOption> option)
{
  NS_LOG_FUNCTION (this << option);

  Ptr<const TcpOptionWinScale> ws = DynamicCast<const TcpOptionWinScale> (option);

  // In naming, we do the contrary of RFC 1323. The received scaling factor
  // is Rcv.Wind.Scale (and not Snd.Wind.Scale)
  m_sndWindShift = ws->GetScale ();

  if (m_sndWindShift > 14)
    {
      NS_LOG_WARN ("Possible error; m_sndWindShift exceeds 14: " << m_sndWindShift);
      m_sndWindShift = 14;
    }

  NS_LOG_INFO (m_node->GetId () << " Received a scale factor of " <<
               static_cast<int> (m_sndWindShift));
}

uint8_t
TcpSocketBase::CalculateWScale () const
{
  NS_LOG_FUNCTION (this);
  uint32_t maxSpace = m_rxBuffer->MaxBufferSize ();
  uint8_t scale = 0;

  while (maxSpace > m_tcpParams->m_maxWinSize)
    {
      maxSpace = maxSpace >> 1;
      ++scale;
    }

  if (scale > 14)
    {
      NS_LOG_WARN ("Possible error; scale exceeds 14: " << scale);
      scale = 14;
    }

  NS_LOG_INFO ("Node " << m_node->GetId () << " calculated wscale factor of " <<
               static_cast<int> (scale) << " for buffer size " << m_rxBuffer->MaxBufferSize ());
  return scale;
}

void
TcpSocketBase::AddOptionWScale (TcpHeader &header)
{
  NS_LOG_FUNCTION (this << header);
  NS_ASSERT (header.GetFlags () & TcpHeader::SYN);

  Ptr<TcpOptionWinScale> option = CreateObject<TcpOptionWinScale> ();

  // In naming, we do the contrary of RFC 1323. The sended scaling factor
  // is Snd.Wind.Scale (and not Rcv.Wind.Scale)
  m_rcvWindShift = CalculateWScale ();
  //std::cout << "TcpSocketBase::AddOptionWScale: " << (int)m_rcvWindShift << std::endl;
  option->SetScale (m_rcvWindShift);

  header.AppendOption (option);

  NS_LOG_INFO (m_node->GetId () << " Send a scaling factor of " <<
               static_cast<int> (m_rcvWindShift));
}

void
TcpSocketBase::ProcessOptionTimestamp (const Ptr<const TcpOption> option,
                                       const SequenceNumber32 &seq)
{
  NS_LOG_FUNCTION (this << option);

  Ptr<const TcpOptionTS> ts = DynamicCast<const TcpOptionTS> (option);

  // std::cout << "Hong Jiaming 20.0: seq == " << seq << ", m_rxBuffer->NextRxSequence () == " << m_rxBuffer->NextRxSequence () << " ,m_highTxAck == " << m_highTxAck << std::endl;
  if (seq == m_rxBuffer->NextRxSequence () && seq <= m_highTxAck)
    {
      // std::cout << "Hong Jiaming 20: Set m_timestampToEcho" << std::endl;
      m_timestampToEcho = ts->GetTimestamp (); // Hong Jiaming 18: this is the problem, not arrive here at all
    }

  NS_LOG_INFO (m_node->GetId () << " Got timestamp=" <<
               m_timestampToEcho << " and Echo="     << ts->GetEcho ());
}

void TcpSocketBase::ProcessOptions (const TcpHeader& header, bool post)
{
  TcpHeader::TcpOptionList options;
  header.GetOptions (options);

  for(TcpHeader::TcpOptionList::const_iterator it(options.begin()); it != options.end(); ++it)
  {
    Ptr<const TcpOption> option = *it;
    if(post)
    {
      PostProcessOption (option);
    }
    else
    {
      PreProcessOption (option);
    }
  }

}

void TcpSocketBase::PreProcessOption (Ptr<const TcpOption> option)
{
  //Nothing here, implement in subclasses
}

void TcpSocketBase::PostProcessOption (Ptr<const TcpOption> option)
{
  //Nothing here, implement in subclasses
}


TcpSocket::TcpStates_t
TcpSocketBase::GetState() const
{
    return m_state;
}

void TcpSocketBase::SetState (TcpStates_t aState)
{
  m_state = aState;
}

void
TcpSocketBase::AddOptionTimestamp (TcpHeader& header)
{
  NS_LOG_FUNCTION (this << header);

  Ptr<TcpOptionTS> option = CreateObject<TcpOptionTS> ();

  option->SetTimestamp (TcpOptionTS::NowToTsValue ());
  option->SetEcho (m_timestampToEcho);

  bool tsAdded = header.AppendOption (option);
  // std::cout << "Hong Jiaming 15 TS added: " << tsAdded << std::endl;
  NS_LOG_INFO (m_node->GetId () << "Hong Jiaming 15: Add option TS, ts=" <<
               option->GetTimestamp () << " echo=" << m_timestampToEcho << " rtt=" << 2*(option->GetTimestamp () - m_timestampToEcho) << " rttEstimator.rtt=" << this->GetRttEstimator()->GetEstimate().GetMicroSeconds());
}

bool
TcpSocketBase::UpdateWindowSize (const TcpHeader &header)
{
  NS_LOG_FUNCTION (this << header);
  //  If the connection is not established, the window size is always
  //  updated
  uint32_t receivedWindow = header.GetWindowSize ();
  receivedWindow <<= m_sndWindShift;
  NS_LOG_INFO ("Received (scaled) window is " << receivedWindow << " bytes");
  if (m_state < ESTABLISHED)
    {
      m_rWnd = receivedWindow;
      NS_LOG_LOGIC ("State less than ESTABLISHED; updating rWnd to " << m_rWnd);
      return true;
    }

  // Test for conditions that allow updating of the window
  // 1) segment contains new data (advancing the right edge of the receive
  // buffer),
  // 2) segment does not contain new data but the segment acks new data
  // (highest sequence number acked advances), or
  // 3) the advertised window is larger than the current send window
  bool update = false;
  if (header.GetAckNumber () == m_highRxAckMark && receivedWindow > m_rWnd)
    {
      // right edge of the send window is increased (window update)
      update = true;
    }
  if (header.GetAckNumber () > m_highRxAckMark)
    {
      m_highRxAckMark = header.GetAckNumber ();
      update = true;
    }
  if (header.GetSequenceNumber () > m_highRxMark)
    {
      m_highRxMark = header.GetSequenceNumber ();
      update = true;
    }
  if (update == true)
    {
      m_rWnd = receivedWindow;
      NS_LOG_LOGIC ("updating rWnd to " << m_rWnd);
    }
  return update;
}

void
TcpSocketBase::UpdateCwnd (uint32_t oldValue, uint32_t newValue)
{
  m_cWndTrace (oldValue, newValue);
}

void
TcpSocketBase::UpdateSsThresh (uint32_t oldValue, uint32_t newValue)
{
  m_ssThTrace (oldValue, newValue);
}

void
TcpSocketBase::UpdateCongState (TcpSocketState::TcpCongState_t oldValue,
                                TcpSocketState::TcpCongState_t newValue)
{
  m_congStateTrace (oldValue, newValue);
}

void
TcpSocketBase::UpdateNextTxSequence (SequenceNumber32 oldValue,
                                     SequenceNumber32 newValue)

{
  m_nextTxSequenceTrace (oldValue, newValue);
}

void
TcpSocketBase::UpdateHighTxMark (SequenceNumber32 oldValue, SequenceNumber32 newValue)
{
  m_highTxMarkTrace (oldValue, newValue);
}

Ptr<TcpSocketImpl>
TcpSocketBase::Fork (void)
{
  Ptr<TcpSocketBase> newSock = CopyObject<TcpSocketBase> (this);

  return newSock;
}

uint32_t
TcpSocketBase::SafeSubtraction (uint32_t a, uint32_t b)
{
  if (a > b)
    {
      return a-b;
    }

  return 0;
}

//RttHistory methods
RttHistory::RttHistory (SequenceNumber32 s, uint32_t c, Time t)
  : seq (s),
    count (c),
    time (t),
    retx (false)
{
}

RttHistory::RttHistory (const RttHistory& h)
  : seq (h.seq),
    count (h.count),
    time (h.time),
    retx (h.retx)
{
}

} // namespace ns3
