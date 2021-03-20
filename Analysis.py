import seaborn as sns
import csv
import matplotlib.pyplot as plt
from matplotlib.pyplot import MultipleLocator
import sys
import os
import pandas as pd
import numpy as np
import warnings
from optparse import OptionParser
def proprocess_rtt_data(file_path):
    record0 = []
    record1 = []
    valid = [False, False]
    with open(file_path, 'rt') as txtfile:
        spamreader = csv.reader(txtfile, delimiter=',')
        # print(spamreader)
        next(spamreader)
        for row in spamreader:
            # print("row[0]" + str(row[0]))
            row_list=row[0].split(' ')
            if(len(row_list)!=3):
                continue;
            # print("row"+str(row_list))
            subflow=row_list[0]
            timestamp=row_list[1]
            rtt=row_list[2]
            if subflow=='0':
                record0.append([float(timestamp), float(rtt)/1000])
            if subflow=='1':
                record1.append([float(timestamp), float(rtt)/1000])

    columns0 = ['timestamp','rtt']

    rtt_records0 = pd.DataFrame(record0, columns=columns0)
    rtt_records1 = pd.DataFrame(record1, columns=columns0)

    return rtt_records0,rtt_records1


def AnalyzeClientrtt(rtt_records0,rtt_records1,duration,str_mpcc_algo):
    client_rtt0 = rtt_records0[["timestamp", "rtt"]].values
    client_rtt1 = rtt_records1[["timestamp", "rtt"]].values

    c_s_subflow_1_rtt,=plt.plot(list(client_rtt0[:,0]), list(client_rtt0[:,1]), 'b-') # convert rtt time unit to millisecond
    c_s_subflow_2_rtt,=plt.plot(list(client_rtt1[:, 0]), list(client_rtt1[:, 1]), 'r-')  # convert rtt time unit to millisecond
    #
    # print(list(client_rtt0[0:100,0]))
    # print(list(client_rtt0[0:100,1]))

    plt.legend([c_s_subflow_1_rtt, c_s_subflow_2_rtt], ['subflow 1 rtt', 'subflow 2 rtt'], loc='best')
    plt.title('Time-rtt')
    plt.xlabel('Time / s', fontsize = 14, color = 'black')
    plt.ylabel('rtt / ms', fontsize = 14, color = 'black')
    plt.xlim(0,duration)
    plt.ylim(0,5000)
    x_major_locator=MultipleLocator(10)
    y_major_locator=MultipleLocator(500)
    ax=plt.gca()
    ax.xaxis.set_major_locator(x_major_locator)
    ax.yaxis.set_major_locator(y_major_locator)
    # # plt.show()
    # plt.savefig("rtt_OLIA_1000s.png")
    # # sns.plt.savefig("/home/hong/result_figure/0_static_well_designed/Z1_rr.png", dpi = 150, bbox_inches='tight')
    # plt.clf()
    # plt.close()


def proprocess_throughput_data(file_path):
    record0 = []
    record1 = []
    valid = [False, False]
    max_thr=0.0
    with open(file_path, 'rt') as txtfile:
        spamreader = csv.reader(txtfile, delimiter=',')
        # print(spamreader)
        next(spamreader)
        for row in spamreader:
            row_list=row[0].split(' ')
            if (len(row_list) != 3):
                continue;
            # print("row"+str(row_list))
            subflow=row_list[0]
            timestamp=row_list[1]
            throughput=row_list[2]
            f_thr= float(throughput)
            if(f_thr>max_thr):
                max_thr=f_thr

            if subflow=='0':
                record0.append([float(timestamp),f_thr])
            if subflow=='1':
                record1.append([float(timestamp), f_thr])

    columns0 = ['timestamp','throughput']

    throughput_records0 = pd.DataFrame(record0, columns=columns0)
    throughput_records1 = pd.DataFrame(record1, columns=columns0)

    return throughput_records0,throughput_records1,max_thr


def AnalyzeClientthroughput(throughput_records0,throughput_records1,duration,str_mpcc_algo,max_thr):
    client_throughput0 = throughput_records0[["timestamp", "throughput"]].values
    client_throughput1 = throughput_records1[["timestamp", "throughput"]].values



    c_s_subflow_1_throughput,=plt.plot(list(client_throughput0[:,0]), list(client_throughput0[:,1]), 'b-') # convert cWnd time unit to millisecond
    c_s_subflow_2_throughput,=plt.plot(list(client_throughput1[:, 0]), list(client_throughput1[:, 1]), 'r-')  # convert cWnd time unit to millisecond

    # print(list(client_throughput0))
    print(list(client_throughput0[0:,1]))
    print("The type of the client_throughput0"+str(type(client_throughput0))+" average:"+str(np.mean(client_throughput0[0:,1])))
    print("The type of the client_throughput1" + str(type(client_throughput1))+" average:"+str(np.mean(client_throughput1[0:,1])))

    plt.legend([c_s_subflow_1_throughput, c_s_subflow_2_throughput], ['subflow 1 cWnd', 'subflow 2 cWnd'], loc='best')
    plt.title('Time-throughput')
    plt.xlabel('Time / s', fontsize = 14, color = 'black')
    plt.ylabel('Kbps', fontsize = 14, color = 'black')
    plt.xlim(0,duration)
    plt.ylim(0,max_thr*1.1)
    x_major_locator=MultipleLocator(10)
    y_major_locator=MultipleLocator(max_thr*1.1/10)
    ax=plt.gca()
    ax.xaxis.set_major_locator(x_major_locator)
    ax.yaxis.set_major_locator(y_major_locator)

    # plt.savefig("throughput_OLIA_1000s.png")
    #
    # plt.clf()
    # plt.close()

def proprocess_cWnd_data(file_path):
    record0 = []
    record1 = []
    valid = [False, False]
    max_cwnd=0.0
    with open(file_path, 'rt') as txtfile:
        spamreader = csv.reader(txtfile, delimiter=',')
        # print(spamreader)
        next(spamreader)
        for row in spamreader:
            row_list=row[0].split(' ')
            if (len(row_list) != 3):
                continue;
            # print("row"+str(row_list))
            subflow=row_list[0]
            timestamp=row_list[1]
            cWnds=row_list[2]
            f_cWnds=float(cWnds) 
            if(f_cWnds>max_cwnd):
                max_cwnd=f_cWnds
            if subflow=='0':
                record0.append([float(timestamp), f_cWnds])
            if subflow=='1':
                record1.append([float(timestamp), f_cWnds])

    columns0 = ['timestamp','cWnds']

    cWnd_records0 = pd.DataFrame(record0, columns=columns0)
    cWnd_records1 = pd.DataFrame(record1, columns=columns0)

    return cWnd_records0,cWnd_records1,max_cwnd


def AnalyzeClientCwnd(cWnd_records0,cWnd_records1,duration,str_mpcc_algo,max_cwnd):
    client_cWnd0 = cWnd_records0[["timestamp", "cWnds"]].values
    client_cWnd1 = cWnd_records1[["timestamp", "cWnds"]].values
    # print("cwnd_record"+str(cWnd_records1));



    c_s_subflow_1_cWnd,=plt.plot(list(client_cWnd0[:,0]), list(client_cWnd0[:,1]), 'b-') # convert cWnd time unit to millisecond
    c_s_subflow_2_cWnd,=plt.plot(list(client_cWnd1[:, 0]), list(client_cWnd1[:, 1]), 'r-')  # convert cWnd time unit to millisecond

    # print(list(client_cWnd0[0:100,0]))
    # print(list(client_cWnd0[0:100,1]))

    plt.legend([c_s_subflow_1_cWnd, c_s_subflow_2_cWnd], ['subflow 1 cWnd', 'subflow 2 cWnd'], loc='best')
    plt.title('Time-cWnd')
    plt.xlabel('Time / s', fontsize = 14, color = 'black')
    plt.ylabel('cWnd / byte', fontsize = 14, color = 'black')
    plt.xlim(0,duration)
    plt.ylim(0,max_cwnd*1.1)
    x_major_locator=MultipleLocator(duration/10)
    y_major_locator=MultipleLocator(max_cwnd*1.1/10)
    ax=plt.gca()
    ax.xaxis.set_major_locator(x_major_locator)
    ax.yaxis.set_major_locator(y_major_locator)
    ## plt.show()
    # plt.savefig("cwnd_OLIA_1000s.png")
    # # sns.plt.savefig("/home/hong/result_figure/0_static_well_designed/Z1_rr.png", dpi = 150, bbox_inches='tight')
    # plt.clf()
    # plt.close()

if __name__ == '__main__':
    parser = OptionParser()

    parser.add_option("-d", "--duration", dest="Duration", default=None,
                      help="The duration")
    parser.add_option("-m", "--mpcc_algo", dest="Mpcc_algo", default=None,
                      help="The mptcp congestion control algorithm")
    (options, args) = parser.parse_args()
    duration=int(options.Duration)
    mpcc_algo=int(options.Mpcc_algo)
    str_mpcc_algo="LIA"
    if mpcc_algo==1:
        str_mpcc_algo="OLIA"
    elif mpcc_algo==2:
        str_mpcc_algo = "WVEGAS"


    plt.figure(figsize=(15, 24))
    plt.subplot(3, 1, 1)
    cWnd_records0,cWnd_records1 ,max_cwnd= proprocess_cWnd_data('cwnd_data.txt')
    AnalyzeClientCwnd(cWnd_records0,cWnd_records1,duration,str_mpcc_algo,max_cwnd)


    plt.subplot(3, 1, 2)

    throughput_records0, throughput_records1 ,max_thr= proprocess_throughput_data('thpt_py_recorder.txt')
    AnalyzeClientthroughput(throughput_records0, throughput_records1,duration,str_mpcc_algo,max_thr)

    # plt.figure(figsize=(20, 8))
    plt.subplot(3, 1, 3)

    rtt_records0, rtt_records1 = proprocess_rtt_data('rtt_data.txt')
    AnalyzeClientrtt(rtt_records0, rtt_records1,duration,str_mpcc_algo)
    plt.tight_layout()

    plt.savefig(str_mpcc_algo+" "+str(duration))

