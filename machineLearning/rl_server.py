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
    
    # RL = DeepQNetwork(n_actions=4, n_features=4, learning_rate=0.01, reward_decay=0.9,
    #                   e_greedy=0.9, replace_target_iter=200, memory_size=2000, output_graph=True)
    TestMode=False;

    ddpg = DDPG(1, 5)

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
        recv_str, this_episode_done = socket.recv()
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

        observation_before_action ,reward,thr,rtt = ddpg.extract_observation(dataRecorder,0)
        cwnd,ssThresh= extract_ssThresh(dataRecorder)
        # print("observation_before_action0:" + str(observation_before_action))
        # print("seg:"+str(segmentSize))
        segmentSize=1500



        # print("observation_before_action1:" + str(observation_before_action))
        reward = calculate_reward(dataRecorder, reset = True)

        #print 'episode: ', episode_count
        f = open("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/calculate_reward", 'w'); 
        f.write("time,reward\n")


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
                if TestMode:
                    action = ddpg.choose_action(observation_before_action)
                else:
                    action = ddpg.noise_action(observation_before_action)
                # print("matthew ddpg:"+str(action))
                # action = np.clip(np.random.normal(action, var), -1, 1)
                # if random.random()<var :
                #     action[0]=random.random()*2-1
                # if random.random()<var :
                #     action[1]=random.random()*2-1

                # new_cWnd = cWnd + np.int((cWnd * 1.0 / segmentSize) * a[0]) * segmentSize
                # print("matthew ddpg: " + str(dataRecorder.get_latest_data()["time"]) + ": is going to use action: " + str(action))


                action=apply_action(socket, dataRecorder, action,segmentSize,cwnd[0],cwnd[1],ssThresh) # Apply action to environment
                # dataRecorder.add_pair_to_last_record(name="schedulerId", value=action)

                # sleep(3)
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


                observation_after_action, reward,thr,rtt= ddpg.extract_observation(dataRecorder,0)
                # print("observation_after_action:"+str(observation_after_action))
                cwnd2, ssThresh2 = extract_ssThresh(dataRecorder)
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
                print(str(observation_before_action)+",a= "+str(action)+", r="+str(reward)+",o:"+str(observation_after_action))

                if (step > 200) and (step % 5 == 0) and TestMode==False:
                    # if var > 0.1:
                    #     var *= .9995
                    # print("Update var: "+str(var))
                    ddpg.learn()
                    # print("learning!")

                observation_before_action = observation_after_action
                # ssThresh = ssThresh2
                # cwnd = cwnd2

                f.write(str(dataRecorder.get_latest_data()["time"]) + ',' + str(reward) + '\n')
                # f3.write(str(dataRecorder.get_latest_data()["time"]) + ',' + str(throughput[0]) +',' + str(throughput[1])+ '\n')
                # print("step:" + str(step))
                print("")
                step += 1
            else:
                apply_action(socket, dataRecorder, [-999,-999],segmentSize,cwnd[0],cwnd[1],ssThresh)
                # sleep(0.003)
                recv_str, this_episode_done = socket.recv()  # get new observation and reward
                if this_episode_done is True:
                    print("accumulativeReward in episode "+str(episode_count)+" is "+str(accumulativeReward))
                    f2.write(str(episode_count)+','+str(accumulativeReward)+'\n')
                    break
                # print("recv:" + str(recv_str))

                dataRecorder.add_one_record(recv_str)

        # ddpg.save_model("/home/hong/")




        socket.close()
        socket = None
        f.close()

        # copyfile("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/calculate_reward", '/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_calculate_reward')
        # copyfile("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/mptcp_output/mptcp_client", '/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_mptcp_client')
        # copyfile("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/mptcp_output/mptcp_drops", '/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_mptcp_drops')
        # copyfile("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/mptcp_output/mptcp_server", '/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_mptcp_server')
        # copyfile("/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/mptcp_output/mptcp_monitor", '/home/matthew/mptcp_with_machine_learning-master1/mptcp_with_machine_learning-master/Analysis/rl_training_data/' + str(episode_count) + '_mptcp_monitor')
        episode_count += 1
