#pragma once

#include <string>

namespace ns3{
  void CheckAndCreateDirectory(std::string path);

  void SetConfigDefaults (std::string linkRate,
                          std::string linkDelay,
                          uint32_t segmentSize,
                          uint32_t segmentSizeWithoutHeaders,
                          uint32_t queueSize,
						  uint32_t mpcc_algo);

  void EnableLogging ();
  void link_change();
};
