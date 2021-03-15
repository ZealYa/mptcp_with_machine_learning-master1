#!/bin/bash
#export QT_QPA_PLATFORM=offscreen
#export DISPLAY=:0 # This is only for remote execution. However, above is recommended on the Internet (but not works perfect
declare -A PyConfig; declare -A Ns3Config

tcpBuffer="252144"
routerBBuffer="252144"
routerCBuffer="252144"
link_b_BER="0.000"
link_c_BER="0.000"
mpcc_algo="0" #0:LIA 1:OLIA
topology_id="0"
mptcpApp="1"
duration="100"

function runSet() {
  sudo python3 ./machineLearning/rl_server.py -f "${PyConfig["forceReply"]}" -m "${PyConfig["maxEpisode"]}" -i "${PyConfig["SwitchInterval"]}" -d "${PyConfig["duration"]}" &
#
##  python3 ./machineLearning/rl_server.py -f "${PyConfig["forceReply"]}" -m "${PyConfig["maxEpisode"]}" -i "${PyConfig["SwitchInterval"]}"-p "${PyConfig["portnum2"]}" &
#  # Delay to ensure rl_server.py starts to listen port before the start of ns3. (if not, rl::SocketException is thrown)
  sleep 10
#  for i in {1..1}; do ./waf --run scratch/run/run --command="%s --link_a_BW="${Ns3Config["link_a_BW"]}" --link_b_BW="${Ns3Config["link_b_BW"]}" --link_c_BW="${Ns3Config["link_c_BW"]}"\
#                                --link_a_delay="${Ns3Config["link_a_delay"]}" --link_b_delay="${Ns3Config["link_b_delay"]}" --link_c_delay="${Ns3Config["link_c_delay"]}"\
#                                --link_b_BER="${Ns3Config["link_b_BER"]}" --link_c_BER="${Ns3Config["link_c_BER"]}"  --tcp_buffer_size="$tcpBuffer" --router_b_buffer_size="$routerBBuffer"\
#                                --router_c_buffer_size="$routerCBuffer" --topology_id="$topology_id" --protocol="$protocol" --mptcpApp="$mptcpApp" --duration="$duration"";
#                    done
  for (( episodeNum=1; episodeNum<=${PyConfig["maxEpisode"]}; episodeNum++ ))
  do
    echo "Training episode $episodeNum"
    sudo ./waf --run scratch/run/run --command="%s --link_a_BW="${Ns3Config["link_a_BW"]}" --link_b_BW="${Ns3Config["link_b_BW"]}" --link_c_BW="${Ns3Config["link_c_BW"]}"\
                --link_a_delay="${Ns3Config["link_a_delay"]}" --link_b_delay="${Ns3Config["link_b_delay"]}" --link_c_delay="${Ns3Config["link_c_delay"]}"\
                                --link_b_BER="${Ns3Config["link_b_BER"]}" --link_c_BER="${Ns3Config["link_c_BER"]}"  --tcp_buffer_size="$tcpBuffer" --router_b_buffer_size="$routerBBuffer"\
                                --router_c_buffer_size="$routerCBuffer" --topology_id="$topology_id" --mpcc_algo="$mpcc_algo" --mptcpApp="$mptcpApp" --duration="$duration"";
  done
  
  python3  ./Analysis.py -d "${PyConfig["duration"]} " -m "${PyConfig["mpcc_algo"]} "


}

#####################
unset PyConfig; unset Ns3Config; declare -A PyConfig; declare -A Ns3Config
scheduler="RTT"; #experiment="Exp11"
PyConfig+=(["duration"]=$duration ["mpcc_algo"]=$mpcc_algo ["maxEpisode"]=1 )
Ns3Config+=(["link_a_BW"]="30000Kbps" ["link_b_BW"]="10000Kbps" ["link_c_BW"]="10000Kbps" ["link_a_delay"]="30ms" ["link_b_delay"]="30ms" ["link_c_delay"]="30ms" ["link_b_BER"]="$link_b_BER" ["link_c_BER"]="$link_c_BER")

runSet