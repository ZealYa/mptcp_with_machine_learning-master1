import socket
import json
import pandas
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from time import sleep
from optparse import OptionParser
import random
from rl_socket import Interacter_socket
from RL_core import DDPG
# from RL_core import extract_observation
from RL_core import extract_ssThresh
from RL_core import calculate_reward
from RL_core import apply_action
from RL_core import map_action
from shutil import copyfile

class RecordRTT():
    def __init__(self, path):
        self.f = open(path, 'w')
        self.f.write("timestamp,rtt0,rtt1\n")

    def addRTTRecord(self, one_row):
        rtt0 = -1;
        rtt1 = -1;
        if('rtt0' in one_row):
            rtt0 = int(one_row['rtt0'])
        if('rtt1' in one_row):
            rtt1 = int(one_row['rtt1'])
        self.f.write(str(one_row['time']) + ',' + str(rtt0) + ',' + str(rtt1) + '\n')
        assert ('rtt2' not in one_row)

    def __del__(self):
        if not self.f.closed:
            self.f.close()

class RecordCwnd():
    def __init__(self, path):
        self.f = open(path, 'w')
        self.f.write("timestamp,cWnd0,cWnd1\n")

    def addCwndRecord(self, one_row):
        cWnd0 = -1;
        cWnd1 = -1;
        if('cWnd0' in one_row):
            cWnd0 = int(one_row['cWnd0'])
        if('cWnd1' in one_row):
            cWnd1 = int(one_row['cWnd1'])
        self.f.write(str(one_row['time']) + ',' + str(cWnd0) + ',' + str(cWnd1) + '\n')
        assert ('cWnd2' not in one_row)

    def __del__(self):
        if not self.f.closed:
            self.f.close()

class RecordRwnd():
    def __init__(self, path):
        self.f = open(path, 'w')
        self.f.write("timestamp,rWnd0,rWnd1\n")

    def addRwndRecord(self, one_row):
        rWnd0 = -1;
        rWnd1 = -1;
        if('rWnd0' in one_row):
            rWnd0 = int(one_row['rWnd0'])
        if('rWnd1' in one_row):
            rWnd1 = int(one_row['rWnd1'])
        self.f.write(str(one_row['time']) + ',' + str(rWnd0) + ',' + str(rWnd1) + '\n')
        assert ('rWnd2' not in one_row)

    def __del__(self):
        if not self.f.closed:
            self.f.close()

class RecordUnAck():
    def __init__(self, path):
        self.f = open(path, 'w')
        self.f.write("timestamp,unAck0,unAck1\n")

    def addUnAckRecord(self, one_row):
        unAck0 = -1;
        unAck1 = -1;
        if('unAck0' in one_row):
            unAck0 = int(one_row['unAck0'])
        if('unAck1' in one_row):
            unAck1 = int(one_row['unAck1'])
        self.f.write(str(one_row['time']) + ',' + str(unAck0) + ',' + str(unAck1) + '\n')
        assert ('unAck2' not in one_row)

    def __del__(self):
        if not self.f.closed:
            self.f.close()

class RecordAvailableTxBuffer():
    def __init__(self, path):
        self.f = open(path, 'w')
        self.f.write("timestamp,availableTxBuffer0,availableTxBuffer1\n")

    def addTxBufferRecord(self, one_row):
        availableTxBuffer0 = -1;
        availableTxBuffer1 = -1;
        if('availableTxBuffer0' in one_row):
            availableTxBuffer0 = int(one_row['availableTxBuffer0'])
        if('availableTxBuffer1' in one_row):
            availableTxBuffer1 = int(one_row['availableTxBuffer1'])
        self.f.write(str(one_row['time']) + ',' + str(availableTxBuffer0) + ',' + str(availableTxBuffer1) + '\n')
        assert ('availableTxBuffer2' not in one_row)

    def __del__(self):
        if not self.f.closed:
            self.f.close()

class RecordSchedulerId():
    def __init__(self, path):
        self.f = open(path, 'w')
        self.f.write("timestamp,schedulerId\n")

    def addSchedulerId(self, timeStamp, schedulerId):
        self.f.write(str(timeStamp) + ',' + str(schedulerId) + '\n')

    def __del__(self):
        if not self.f.closed:
            self.f.close()

class RecordMeta():
    def __init__(self, path):
        self.f = open(path, 'w')
        self.f.write("timestamp,lastAckedSeq,highTxMark,availableTxBuffer,nextTxSeq,totalCwnd,unAckMeta\n")

    def addMetaRecord(self, one_row):
        time = str(one_row['time'])
        lastAckedSeq = str(one_row['lastAckedSeqMeta'])
        highTxMark = str(one_row['highTxMarkMeta'])
        availableTxBuffer = str(one_row['availableTxBufferMeta'])
        nextTxSeq = str(one_row['nextTxSeqMeta'])
        totalCwnd = str(one_row['totalCwndMeta'])
        unAck = str(one_row['unAckMeta'])
        self.f.write(time + ',' + lastAckedSeq + ',' + highTxMark + ',' + availableTxBuffer + ',' + nextTxSeq + ',' + totalCwnd + ',' + unAck + '\n')

    def __del__(self):
        if not self.f.closed:
            self.f.close()

def IsInt(s):
    # A naive method, but enough here
    if "." in s:
        return False
    else:
        return True

class DataRecorder():

    def __init__(self):
        self.next_seq_num = 0
        self.data = {}
        self.action = []


    def add_one_record(self, str_data):
        # global g_TcWnd0
        # global g_TcWnd1
        # name#value$name$value...
        # str_data = str_data.encode('utf-8')
        # print(str_data)
        str_data=str_data.decode()

        pair_list = str_data.split("$")
        # print(pair_list)
        one_row = {}
        for pair in pair_list:
            if len(pair) > 3: # this ensures the string (pair) is not empty or string with single '$'
                name_val_list = pair.split("#")
                # print("matthew : 1 "+str(pair)+ str(len(name_val_list))+str(name_val_list[0])+str(name_val_list[1]))
                if IsInt(name_val_list[1]):
                    one_row[name_val_list[0]] = int(name_val_list[1])
                else:
                    one_row[name_val_list[0]] = float(name_val_list[1])

        # ensure this transmission is right and complete
        # neighbour TCP segments must not combined into one
        assert one_row["size"] == len(one_row)
        # assert one_row["ssn"] == self.next_seq_num
        # self.rttRecord.addRTTRecord(one_row)
        # self.cWndRecord.addCwndRecord(one_row)
        # self.rWndRecord.addRwndRecord(one_row)
        # self.unAckRecord.addUnAckRecord(one_row)
        # self.availableTxBufferRecord.addTxBufferRecord(one_row)
        # self.metaRecord.addMetaRecord(one_row)
        self.data[self.next_seq_num] = one_row
        self.next_seq_num += 1          

    def get_data_dic(self):
        return self.data

    def get_latest_data(self):
        return self.data[self.next_seq_num-1]

    def add_pair_to_last_record(self, name, value):
        self.data[self.next_seq_num-1][name] = value
        # if name is "schedulerId":
        #     self.schedulerIdRecord.addSchedulerId(timeStamp=self.data[self.next_seq_num-1]["time"], schedulerId=value)

    def print_all_data(self):
        #matthew  print("dic size: "+str(len(self.data)))
        for ssn, data in self.data.iteritems():
            for k, v in data.iteritems():
              print("")
              # matthew  print("key: "+str(k)+ "value: "+str(v))

    def print_latest_data(self):
        latest_data = self.data[self.next_seq_num-1]
        for k, v in latest_data.iteritems():
            print("")
            # print("key: "+str(k)+ "value: "+str(v))



def nomorlize_obs(obs,h,l):
    # Observation space


    sc = h - l
    o_c = (h + l) / 2.
    o_sc = sc / 2.
    # print("obs::"+str(obs))
    # print((obs-o_c) /o_sc)

    return (obs-o_c) /o_sc


class flow_state(object):
    """
    docstring
    """
    Ordinary = 0
    EI_c_1 = 1 #
    EI_r_1 = 2 #
    EI_c_2 = 3 #receive ack of the class action and generate the reward 
    EI_r_2 = 4 #receive ack of the rl action and generate the reward

EI_sequence=[0,0] #0:cl first 1:rl first
u_1=[0,0] 
u_2=[0,0] 
u_3=[0,0] 

r=[0,0]



if __name__ == "__main__":

    #parameters

    parser = OptionParser()
    parser.add_option("-f", "--forceReply", dest="ForceReply", default=None, help="Force RL module reply a scheduler")
    parser.add_option("-m", "--maxEpisode", dest="MaxEpisode", default=1, help="The number of times to train (launch NS3)")
    parser.add_option("-i", "--switchInterval", dest="SwitchInterval", default=-1, help="The interval of switching scheduler")
    parser.add_option("-d", "--duration", dest="duration", default=30, help="The duration")
    # parser.add_option("-t", "--testMode", dest="testMode", default=0,help="Test/Train")
    (options, args) = parser.parse_args()

    episode_count = 1
    accumulativeReward = 0
    Total_thr = 0
    Total_rtt = 0
    Samples_count=400
    event_record = {"Events":[]}
    

    subflow1_state=flow_state.Ordinary
    subflow2_state=flow_state.Ordinary
    cwnd_list=[[],[]]
    # currentState=0
    # currentCwnd=0

    
    
    # RL = DeepQNetwork(n_actions=4, n_features=4, learning_rate=0.01, reward_decay=0.9,
    #                   e_greedy=0.9, replace_target_iter=200, memory_size=2000, output_graph=True)
    TestMode=False;

    ddpg = DDPG(1, 50)

    print("Total epsodes:")
    print(int(options.MaxEpisode))

    # var = 1  # control exploration
    f2 = open("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/calculate_reward_history2", 'w')
    f2.write("epsode,reward\n")
    while episode_count <= int(options.MaxEpisode):
        
        # rttRecorder = RecordRTT('/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_client_rtt')
        # cWndRecorder = RecordCwnd('/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_client_cWnd')
        # rWndRecorder = RecordRwnd('/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_client_rWnd')
        # unAckRecorder = RecordUnAck('/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_client_unAck')
        # availableTxBufferRecord = RecordAvailableTxBuffer('/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_client_txBufferSize')
        # metaRecorder = RecordMeta('/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_meta_socket')
        # schedulerIdRecord = RecordSchedulerId('/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_schedulerId')
        dataRecorder = DataRecorder()
        event={}
        event["Name"]="Episode"
        event["episode"]=episode_count
        event["Reward"]=accumulativeReward/Samples_count
        event["throughput"]=Total_thr/Samples_count
        event["latency"]=Total_rtt/Samples_count
        event_record["Events"].append(event)
        thpt_record=""
        rtt_record=""

        if (episode_count)%100==0:
            TestMode = True
            with open('whole_process_run.json','w') as f:
                json.dump(event_record,f,indent=4)
        else:
            TestMode = False

        


        # f3=open('/home/hong/workspace/mptcp/ns3/rl_training_data/' + str(episode_count) + '_throughput','w')
        # f3.write("timestamp,throughput0,throughput1\n")
        socket = Interacter_socket(host = '127.0.0.3', port = 12345)
        socket.listen()
        print("[Py]episode_count:"+str(episode_count))
        recv_str, this_episode_done = socket.recv()
        print("type:")
        if(type(recv_str)==type("str")):
            socket.close()
            socket = None
            f.close()
            continue
        last_rcvstr = recv_str

        # if this_episode_done:
        #     #print("key: ")#, k, "value: ", v
        #     print("")
        #
        #     # print("RL server ended too early! " + recv_str); exit() matthew
        # OldSeqNum = [0, 0]
        # OldAckTime = [0, 0]
        # OldAckTime2 = [0,0]
        # I=[0,0]
        dataRecorder.add_one_record(recv_str)  #

        observation_before_action=np.zeros(50)
        current_subflowid=int(dataRecorder.get_latest_data()['subflowid'])
        observation_before_action ,reward,thr,rtt = ddpg.extract_observation(dataRecorder,current_subflowid,observation_before_action)
        
        cwnd,ssThresh,subflowstates= extract_ssThresh(dataRecorder)
        prev_cwnd=cwnd
        # if current_subflowid  == 0:
        #     currentState=subflowstates[0]
        #     currentCwnd=cwnd[0]
        # else:
        #     currentState=subflowstates[1]
        #     currentCwnd=cwnd[1]
        
        # print("observation_before_action0:" + str(observation_before_action))
        # print("seg:"+str(segmentSize))
        segmentSize=1500



        # print("observation_before_action1:" + str(observation_before_action))
        # reward = calculate_reward(dataRecorder, reset = True)

        #print 'episode: ', episode_count
        f = open("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/calculate_reward", 'w'); 
        f.write("time,reward\n")
        thpt_writer = open("throughput_data.txt", 'w')
        rtt_writer = open("rtt_data.txt", 'w')


        step, lastSchedulerTiming, accumulativeReward = 0, float("-inf"), 0 # float("-inf") ensures that a scheduler is choosen at first time
        Total_thr= 0
        Total_rtt=0
        Samples_count=1
        totalThpt1=0
        totalThpt2=0
        count_done=0
        



        while True:
            # Choose action
            #matthew
            # print ('recv_str: '+str(recv_str))
            # print ('observation: '+ str(observation_before_action))
            # print(count)
            # print(episode_count)
            
            shouldUpdata = False
            # print("dataRecorder.get_latest_data()"+str(dataRecorder.get_latest_data()["time"]))
            # print("lastSchedulerTiming"+str(lastSchedulerTiming))
            # print("options.SwitchInterval"+options.SwitchInterval)
            # print("distance:"+str(dataRecorder.get_latest_data()["time"] - lastSchedulerTiming))
            if dataRecorder.get_latest_data()["time"] - lastSchedulerTiming >-1 : # in microsecond  int(options.SwitchInterval)
                lastSchedulerTiming = dataRecorder.get_latest_data()["time"]
                shouldUpdata = True
                # accumulativeReward = 0

            if shouldUpdata:
                Samples_count=Samples_count+1

                # print("observation_before_action:"+str(observation_before_action))
                
                # print("matthew ddpg:"+str(action))
                # action = np.clip(np.random.normal(action, var), -1, 1)
                # if random.random()<var :
                #     action[0]=random.random()*2-1
                # if random.random()<var :
                #     action[1]=random.random()*2-1

                # new_cWnd = cWnd + np.int((cWnd * 1.0 / segmentSize) * a[0]) * segmentSize
                print("[Py]matthew:lastAckedSeqMeta:"+str(dataRecorder.get_latest_data()["lastAckedSeqMeta"]))
                print("[Py]matthew:current_subflowId:"+str(dataRecorder.get_latest_data()['subflowid']))
                # if current_subflowid  == 0:
                #     currentState=subflowstates[0]
                #     currentCwnd=cwnd[0]
                # else:
                #     currentState=subflowstates[1]
                #     currentCwnd=cwnd[1]

                r[current_subflowid]=reward
                a_rl=0
                print("[Py]matthew Time: " + str(dataRecorder.get_latest_data()["time"]))#+"obs:"+str(observation_before_action))
                print("[Py]prev:"+str(prev_cwnd[current_subflowid]))
                #*****Traditional RL Part******
                if TestMode:
                    a_rl = ddpg.choose_action(observation_before_action)
                    a_final = map_action(dataRecorder, a_rl,segmentSize,prev_cwnd[current_subflowid],58000)
                    # a_final=50000
                    prev_cwnd[current_subflowid]=a_final
                else:
                    a_rl = ddpg.choose_action(observation_before_action)
                    # a_rl = ddpg.noise_action(observation_before_action)
                    a_final = map_action(dataRecorder, a_rl,segmentSize,prev_cwnd[current_subflowid],58000)
                    # a_final=50000
                    prev_cwnd[current_subflowid]=a_final
                
                print("action:"+str(a_rl))
                #*****Traditional RL Part end!******
                #*****MP-Libra Part******
                # if subflowstates[current_subflowid]==flow_state.Ordinary:
                #     print("[Py]matthew:stage:Ordinary")
                            
                #     cwnd_list[current_subflowid].clear()
                #     a_rl = ddpg.choose_action(observation_before_action)
                    
                #     x_r = map_action(dataRecorder, a_rl,segmentSize,prev_cwnd[current_subflowid])
                #     x_c = cwnd[current_subflowid]
                #     print("[Py]x_r:"+str(x_r)+" x_c:"+str(x_c)+" prev_cwnd:"+str(prev_cwnd[current_subflowid]))
                #     if np.abs(x_r-x_c)>=0.2*prev_cwnd[current_subflowid]:#prev_cwnd not defined yet
                #         if(x_r-prev_cwnd[current_subflowid])*(x_c-prev_cwnd[current_subflowid])>0 :
                #             if x_r>x_c:
                #                 cwnd_list[current_subflowid].append(x_c)
                #                 cwnd_list[current_subflowid].append(x_r)
                #                 print(str(cwnd_list[current_subflowid]))
                #                 EI_sequence[current_subflowid]=1
                #                 a_final=cwnd_list[current_subflowid][0]
                #                 subflowstates[current_subflowid]=flow_state.EI_c_1
                #             else:
                #                 cwnd_list[current_subflowid].append(x_r)
                #                 cwnd_list[current_subflowid].append(x_c)
                #                 print(str(cwnd_list[current_subflowid]))
                #                 EI_sequence[current_subflowid]=0
                #                 a_final=cwnd_list[current_subflowid][0]
                #                 subflowstates[current_subflowid]=flow_state.EI_r_1
                #         else:
                #             if x_r>x_c:
                #                 cwnd_list[current_subflowid].append(x_c)
                #                 cwnd_list[current_subflowid].append(x_r)
                #                 print(str(cwnd_list[current_subflowid]))
                #                 EI_sequence[current_subflowid]=1
                #                 a_final=cwnd_list[current_subflowid][0]
                #                 subflowstates[current_subflowid]=flow_state.EI_c_1
                #             else:
                #                 cwnd_list[current_subflowid].append(x_r)
                #                 cwnd_list[current_subflowid].append(x_c)
                #                 print(str(cwnd_list[current_subflowid]))
                #                 EI_sequence[current_subflowid]=0
                #                 a_final=cwnd_list[current_subflowid][0]
                #                 subflowstates[current_subflowid]=flow_state.EI_r_1   
                #     else:
                #         a_final=x_c
                #     a_final=x_r
                # elif subflowstates[current_subflowid]==flow_state.EI_c_1:
                #     print("[Py]matthew:stage:EI_c_1")
                #     if EI_sequence[current_subflowid]==1:#cl先行 下一个状态是EI_r_1
                #         u_1[current_subflowid]=r[current_subflowid]/rtt#得到u1但是后续需要除episode的长度
                #         print("[Py]u_1:"+str(u_1[current_subflowid]))
                #         subflowstates[current_subflowid]=flow_state.EI_r_1
                #         a_final=cwnd_list[current_subflowid][1]
                #     else:
                #         subflowstates[current_subflowid]=flow_state.EI_r_2
                #         a_final=prev_cwnd[current_subflowid]
                # elif subflowstates[current_subflowid]==flow_state.EI_r_1:
                #     print("[Py]matthew:stage:EI_r_1")
                #     if EI_sequence[current_subflowid]==0:#rl先行 下一个状态是EI_c_1
                #         u_1[current_subflowid]=r[current_subflowid]/rtt#得到u1但是后续需要除episode的长度
                #         print("[Py]u_1:"+str(u_1[current_subflowid]))
                #         subflowstates[current_subflowid]=flow_state.EI_c_1
                #         a_final=cwnd_list[current_subflowid][1]
                #     else:
                #         subflowstates[current_subflowid]=flow_state.EI_c_2
                #         a_final=prev_cwnd[current_subflowid]

                # elif subflowstates[current_subflowid]==flow_state.EI_c_2:
                #     print("[Py]matthew:stage:EI_c_2")
                #     if EI_sequence[current_subflowid]==1:#cl先行 下一个动作是EI_r_2
                #         u_2[current_subflowid]=2*r[current_subflowid]/rtt#得到u2但是后续需要除episode的长度
                #         print("[Py]u_2:"+str(u_2[current_subflowid]))
                #         subflowstates[current_subflowid]=flow_state.EI_r_2
                #                 # a_final=a_r
                #     else:
                #         subflowstates[current_subflowid]=flow_state.Ordinary#Evaluation结束进入Ordinary
                #         u_3[current_subflowid]=2*r[current_subflowid]/rtt
                #         print("[Py]matthew:u_1:"+str(u_1[current_subflowid])+"  u_2:"+str(u_2[current_subflowid])+" u_3:"+str(u_3[current_subflowid]))
                #         if max(u_2[current_subflowid],u_3[current_subflowid])>=u_1[current_subflowid]:
                #             if(u_2[current_subflowid]>u_3[current_subflowid]):#EI——sequence=1 rl先行
                #                 a_final=cwnd_list[current_subflowid][0]
                #                 # strRLCWND_record.strip()
                #                 # strRLCWND_record+=" 1"
                #                 prev_cwnd[current_subflowid]=a_final
                #                 # rl_count+=1
                #             else:
                #                 a_final=cwnd_list[current_subflowid][1]
                #                 # print(strCLCWND_record)
                #                 # strCLCWND_record.strip('')
                #                 # strCLCWND_record+=" 1"
                #                 # print(strCLCWND_record)
                #                 prev_cwnd[current_subflowid]=a_final
                #                 # cl_count+=1
                #         else:
                #             a_final=prev_cwnd[current_subflowid]
                #         # strCWND_record+=(str(int((current_time-start)*1000000)/1000000)+" "+str(a_final)+"\n")
                # elif subflowstates[current_subflowid]==flow_state.EI_r_2:
                #     print("[Py]matthew:stage:EI_r_2")
                #     if EI_sequence[current_subflowid]==0:#rl先行 下一个动作是EI_c_2
                #         u_2[current_subflowid]=2*r[current_subflowid]/rtt#得到u2但是后续需要除episode的长度
                #         print("[Py]u_2:"+str(u_2[current_subflowid]))
                #         subflowstates[current_subflowid]=flow_state.EI_c_2
                #                 # a_final=a_r
                #     else:
                #         subflowstates[current_subflowid]=flow_state.Ordinary#Evaluation结束进入Ordinary
                #         u_3[current_subflowid]=2*r[current_subflowid]/rtt
                #         print("[Py]matthew:u_1:"+str(u_1[current_subflowid])+"  u_2:"+str(u_2[current_subflowid])+" u_3:"+str(u_3[current_subflowid]))
                #         if max(u_2[current_subflowid],u_3[current_subflowid])>=u_1[current_subflowid]:
                #             if(u_2[current_subflowid]>u_3[current_subflowid]):#EI——sequence=1 rl先行
                #                 a_final=cwnd_list[current_subflowid][0]
                #                 # strRLCWND_record.strip()
                #                 # strRLCWND_record+=" 1"
                #                 prev_cwnd[current_subflowid]=a_final
                #                 # rl_count+=1
                #             else:
                #                 a_final=cwnd_list[current_subflowid][1]
                #                 # print(strCLCWND_record)
                #                 # strCLCWND_record.strip('')
                #                 # strCLCWND_record+=" 1"
                #                 # print(strCLCWND_record)
                #                 prev_cwnd[current_subflowid]=a_final
                #                 # cl_count+=1
                #         else:
                #             a_final=prev_cwnd[current_subflowid]
                #*****MP-Libra Part end******


                

                # if current_subflowid  == 0:
                #     action=map_action(dataRecorder, action,segmentSize,cwnd[0],cwnd[1],subflow1_state,ssThresh) # Apply action to environment
                # else:
                #     action=map_action(dataRecorder, action,segmentSize,cwnd[0],cwnd[1],subflow2_state,ssThresh) # Apply action to environment
                
                # dataRecorder.add_pair_to_last_record(name="schedulerId", value=action)

                # sleep(3)
                action= apply_action(socket, a_rl,a_final,subflowstates[current_subflowid])
                recv_str, this_episode_done = socket.recv() # get new observation and reward


                if(int(options.duration)==100):
                    if int(dataRecorder.get_latest_data()["time"])>99000000:
                        print("The throughput of subflow1:" + str(totalThpt1) + "pkts/s")
                        print("The throughput of subflow2:" + str(totalThpt2) + "pkts/s")
                        print("The total throughput :" + str(totalThpt1 + totalThpt2) + "pkts/s")
                        print("accumulativeReward in episode "+str(episode_count)+" is "+str(accumulativeReward))


                if this_episode_done is True:
                    if (int(options.duration) == 30):
                        print("The throughput of subflow1:" + str(totalThpt1) + "pkts/s")
                        print("The throughput of subflow2:" + str(totalThpt2) + "pkts/s")
                        print("The total throughput :" + str(totalThpt1 + totalThpt2) + "pkts/s")
                        



                    f2.write(str(episode_count) + ',' + str(accumulativeReward) + '\n')
                    # print("finish write!")

                    break

                # print("recv:" + str(recv_str))

                dataRecorder.add_one_record(recv_str)

                current_subflowid=int(dataRecorder.get_latest_data()['subflowid'])
                observation_after_action, reward,thr,rtt= ddpg.extract_observation(dataRecorder,current_subflowid,observation_before_action)
                
                # thpt_writer.write()
                thpt_record+=(str(dataRecorder.get_latest_data()['subflowid']) + ' ' + str(float(dataRecorder.get_latest_data()['time'])/10e5) + ' ' + str(thr) + '\n')
                rtt_record+=(str(dataRecorder.get_latest_data()['subflowid']) + ' ' + str(float(dataRecorder.get_latest_data()['time'])/10e5) + ' ' + str(rtt) + '\n')
                # print("observation_after_action:"+str(observation_after_action))
                cwnd2, ssThresh2,subflowstates = extract_ssThresh(dataRecorder)
                # observation_after_action = nomorlize_obs(observation_after_action, 2147483647, 0)
                # print("cwnd: "+str(cwnd2[0])+" "+str(cwnd2[1]))
                # reward,throughput,totalThpt1,totalThpt2 = calculate_reward(dataRecorder)
                accumulativeReward += reward
                Total_thr += thr
                Total_rtt += rtt
                # print("accumulativeReward:"+str(accumulativeReward))

                # # Update memory
                if TestMode== False:
                    ddpg.store_transition(observation_before_action, action, reward, observation_after_action,this_episode_done,episode_count)
                # print(str(observation_before_action)+",a= "+str(action)+", r="+str(reward)+",o:"+str(observation_after_action))

                # if (step > 200) and (step % 5 == 0) and TestMode==False:
                #     # if var > 0.1:
                #     #     var *= .9995
                #     # print("Update var: "+str(var))
                #     ddpg.learn()
                #     print("learning!")

                observation_before_action = observation_after_action
                # ssThresh = ssThresh2
                cwnd = cwnd2

                f.write(str(dataRecorder.get_latest_data()["time"]) + ',' + str(reward) + '\n')
                # f3.write(str(dataRecorder.get_latest_data()["time"]) + ',' + str(throughput[0]) +',' + str(throughput[1])+ '\n')
                print("step:" + str(step))
                print("")
                step += 1
            else:
                if current_subflowid  == 0:
                    action=apply_action(socket, dataRecorder, action,segmentSize,cwnd[0],cwnd[1],subflow1_state,ssThresh) # Apply action to environment
                else:
                    action=apply_action(socket, dataRecorder, action,segmentSize,cwnd[0],cwnd[1],subflow2_state,ssThresh) # Apply action to environment
                # sleep(0.003)
                recv_str, this_episode_done = socket.recv()  # get new observation and reward
                if this_episode_done is True:
                    print("accumulativeReward in episode "+str(episode_count)+" is "+str(accumulativeReward))
                    f2.write(str(episode_count)+','+str(accumulativeReward)+'\n')
                    break
                # print("recv:" + str(recv_str))

                dataRecorder.add_one_record(recv_str)




        socket.close()
        socket = None
        f.close()
        # print("resStr:"+thpt_record)
        thpt_writer.write(thpt_record)
        thpt_writer.close()
        rtt_writer.write(rtt_record)
        rtt_writer.close()

        episode_count += 1
