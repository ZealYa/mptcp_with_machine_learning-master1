#!/bin/bash

#export QT_QPA_PLATFORM=offscreen
export DISPLAY=:0 # This is only for remote execution. However, above is recommended on the Internet (but not works perfect
declare -A PyConfig; declare -A Ns3Config

tcpBuffer="25214400"
routerBBuffer="5000000"
routerCBuffer="5000000"
link_b_BER="0.000002"
link_c_BER="0.000002"
topology_id="0"

function runSet() {
  dirPath="/home/hong/result_figure/debug"
  cp "/home/hong/result_figure/template.csv" "/home/hong/result_figure/statistic.csv"
  mkdir -p $dirPath

  python3 ./machineLearning/log_analyzer.py -e "${PyConfig["experiment"]}" -s "${PyConfig["scheduler"]}" -n "${PyConfig["episodeNum"]}" -b "${Ns3Config["link_b_BW"]}" -c "${Ns3Config["link_c_BW"]}" -d "$dirPath"




  mv "/home/hong/result_figure/statistic.csv" "${dirPath}/statistic.csv"
}

#####################
unset PyConfig; unset Ns3Config; declare -A PyConfig; declare -A Ns3Config
scheduler="RTT"; experiment="Exp11"
PyConfig+=(["experiment"]=$experiment ["forceReply"]=$scheduler ["maxEpisode"]="30" ["SwitchInterval"]="300" ["scheduler"]=$scheduler ["episodeNum"]="30")
Ns3Config+=(["link_a_BW"]="1000Kbps" ["link_b_BW"]="500Kbps" ["link_c_BW"]="500Kbps" ["link_a_delay"]="6ms" ["link_b_delay"]="15ms" ["link_c_delay"]="15ms" ["link_b_BER"]="$link_b_BER" ["link_c_BER"]="$link_c_BER")
runSet
