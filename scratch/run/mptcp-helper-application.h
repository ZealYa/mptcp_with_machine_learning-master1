#pragma once

#include "ns3/internet-module.h"

namespace ns3{

void InstallOnOffApplications(NodeContainer& servers,
                              NodeContainer& clients,
                              uint32_t packetSize,uint32_t mptcpApp);

void InstallMultiOnOffApplications(NodeContainer& servers,
                              NodeContainer& clients,
                              uint32_t packetSize,uint32_t mptcpApp);

void InstallFileTransferApplications(NodeContainer& servers,
                                     NodeContainer& clients,
                                     uint32_t packetSize,
                                     uint32_t queueSize);

};
