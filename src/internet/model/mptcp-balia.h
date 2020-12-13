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
#ifndef MPTCP_CC_BALIA_H
#define MPTCP_CC_BALIA_H


#include <stdint.h>
#include "ns3/object.h"
#include "tcp-congestion-ops.h"

namespace ns3
{

class MpTcpMetaSocket;

class MpTcpBalia : public TcpNewReno
{
public:
  /**
   * \brief Get the type ID.
   * \return the object TypeId
   */
  static TypeId GetTypeId (void);
  virtual TypeId GetInstanceTypeId (void);

  MpTcpBalia ();
  MpTcpBalia (const MpTcpBalia& sock);

  ~MpTcpBalia ();

  virtual std::string GetName () const override;

  /**
   *
   Note that the calculation of alpha does not take into account path
   MSS and is the same for stacks that keep cwnd in bytes or packets.
   */
  virtual void IncreaseWindow (Ptr<TcpSocketState> tcb, uint32_t segmentsAcked) override;

  virtual uint32_t GetSsThresh (Ptr<const TcpSocketState> tcb,
                                uint32_t bytesInFlight) override;

  virtual Ptr<TcpCongestionOps> Fork () override;

protected:
  double ComputeAlpha_r(Ptr<MpTcpMetaSocket> metaSock, Ptr<const TcpSocketState> tcb) const;
  double ComputeIncreaseFactor(Ptr<MpTcpMetaSocket> metaSock, Ptr<TcpSocketState> tcb) const;
};
}

#endif /* MPTCP_CC_BALIA_H */
