import seaborn as sns
import csv
import matplotlib.pyplot as plt
import sys
import os
import pandas as pd
import numpy as np
import warnings
from optparse import OptionParser





warnings.filterwarnings("error")
g_resultRecord = {}


def AnalyzeClientCwnd(cWnd_records):
    client_cWnd0 = cWnd_records[["Timestamp", "cWnd0"]].values
    client_cWnd1 = cWnd_records[["Timestamp", "cWnd1"]].values

    c_s_subflow_1_cWnd, = plt.plot(list(client_cWnd0[:,0]), list(client_cWnd0[:,1]), 'b-') # convert cWnd time unit to millisecond
    c_s_subflow_2_cWnd, = plt.plot(list(client_cWnd1[:,0]), list(client_cWnd1[:,1]), 'r-')

    plt.legend([c_s_subflow_1_cWnd, c_s_subflow_2_cWnd], ['subflow 1 cWnd', 'subflow 2 cWnd'], loc='best')
    plt.title('Time-cWnd')
    plt.xlabel('Time / s', fontsize = 14, color = 'black')
    plt.ylabel('cWnd / byte', fontsize = 14, color = 'black')

def proprocess_cWnd_data(file_path):
    record = []
    valid = [False, False]
    with open(file_path, 'rt') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',')
        next(spamreader)
        for row in spamreader:
            timestamp = (int(row[0])*1.0)/1e6

            if valid[0] is False:
                valid[0] = True if int(row[1]) != -1 else False
            if valid[1] is False:
                valid[1] = True if int(row[2]) != -1 else False

            cWnd0 = int(row[1]) if valid[0] is True else 0
            cWnd1 = int(row[2]) if valid[1] is True else 0

            record.append([timestamp, cWnd0, cWnd1])

    columns = ['Timestamp','cWnd0','cWnd1']
    cWnd_records = pd.DataFrame(record, columns=columns)

    return cWnd_records



def analyze_reward(file_path,save_path):
    record = []
    # '/home/hong/workspace/mptcp/ns3/mptcp_output/mptcp_client'
    reward_sum=0
    with open(file_path, 'rt') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',')
        next(spamreader)
        for row in spamreader:
            timestamp = int(row[0])/1e9
            reward = float(row[1])
            reward_sum=reward_sum+reward
            record.append([timestamp, reward])

    record.sort(key=lambda ele:ele[0])
    x, y = [], []
    for pair in record:
        x.append(pair[0])
        y.append(pair[1])
    reward_plt, = plt.plot(x, y, 'k-')
    plt.legend([reward_plt], ['reward'], loc='best')
    plt.title('Time-Reward'+str(reward_sum))
    plt.xlabel('Time / s', fontsize = 14, color = 'black')
    plt.ylabel('Reward', fontsize = 14, color = 'black')
    plt.savefig(save_path)
    plt.clf()
    plt.close()






def analyze_acc_reward(file_path,save_path):
    record = []
    # '/home/hong/workspace/mptcp/ns3/mptcp_output/mptcp_client'
    # reward_sum=0
    with open(file_path, 'rt') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',')
        next(spamreader)
        for row in spamreader:
            episode = int(row[0])
            reward = float(row[1])
            # reward_sum=reward_sum+reward
            record.append([episode, reward])

    record.sort(key=lambda ele:ele[0])
    x, y = [], []
    for pair in record:
        x.append(pair[0])
        y.append(pair[1])
    reward_plt, = plt.plot(x, y, 'k-')
    plt.legend([reward_plt], ['accumulative_reward'], loc='best')
    plt.title('episode-Reward')
    plt.xlabel('episode', fontsize = 14, color = 'black')
    plt.ylabel('Reward', fontsize = 14, color = 'black')
    plt.savefig(save_path)
    plt.clf()
    plt.close()



if __name__ == '__main__':

    parser = OptionParser()
    parser.add_option("-f", "--filename", dest="Filename", default="/home/hong/result_figure/statistic.csv", help="write report to FILE", metavar="FILE")
    parser.add_option("-e", "--experiment", dest="Experiment", default=None, help="The name(index) of experiment. E.g. \"Exp_1\"")
    parser.add_option("-s", "--scheduler", dest="Scheduler", default=None, help="The name of sechduler. E.g. \"RR\"")
    parser.add_option("-n", "--episodeNum", dest="EpisodeNum", default=None, help="The number of episode to analyze")
    parser.add_option("-b", "--linkBBandwidth", dest="LinkBBW", default=None, help="The bandwidth of link B")
    parser.add_option("-c", "--linkCBandwidth", dest="LinkCBW", default=None, help="The bandwidth of link C")
    parser.add_option("-d", "--dirPath", dest="DirPath", default=None, help="The dir path to store figures and relative data")
    (options, args) = parser.parse_args()
    g_resultRecord['Filename'] = options.Filename
    g_resultRecord['Experiment'] = options.Experiment
    g_resultRecord['Scheduler'] = options.Scheduler
    g_resultRecord['DirPath'] = options.DirPath
    assert os.path.isdir(options.DirPath) is True

    episode_num = int(options.EpisodeNum)
    print("log_analysis:episode--"+str(episode_num))

    i=0
    while i<episode_num:
        print("saving:"+str(i))
        plt.figure(figsize=(10, 8))


        plt.subplot(1, 1, 1)
        cWnd_records = proprocess_cWnd_data(
            '/home/hong/workspace/mptcp/ns3/rl_training_data/' + str(i) + '_client_cWnd')
        AnalyzeClientCwnd(cWnd_records)


        plt.savefig(os.path.join(options.DirPath,
                                 options.Experiment + "_cWnd_" + str(i) + ".png"),
                    dpi=150, bbox_inches='tight')
        # sns.plt.savefig("/home/hong/result_figure/0_static_well_designed/Z1_rr.png", dpi = 150, bbox_inches='tight')
        plt.clf()
        plt.close()


        print("saved in :" + options.DirPath)
        # plt.savefig(os.path.join(options.DirPath,
        #                          options.Experiment + "_" + options.Scheduler + '_meta_' + str(i) + ".png"),
        #             dpi=150, bbox_inches='tight')
        # plt.clf()
        # plt.close()

        # recordResultToCsv()

        analyze_reward('/home/hong/workspace/mptcp/ns3/rl_training_data/' + str(i) + '_calculate_reward',
                       os.path.join(options.DirPath,
                                    options.Experiment + "_Reward" + "_" + str(i) + ".png"))



        i=i+1


    analyze_acc_reward('/home/hong/workspace/mptcp/ns3/mptcp_output/calculate_reward_history2',
                       os.path.join(options.DirPath,
                                    "accumilative_Reward.png"))

