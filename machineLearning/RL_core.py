import numpy as np
import pandas as pd
import os
import math
import tensorflow as tf
import random
from time import sleep
from rl_socket import Interacter_socket
# from rl_server import DataRecorder
# import tensorflow as tf
# import numpy as np
from ou_noise import OUNoise
from critic_network import CriticNetwork
from actor_network_bn import ActorNetwork
from replay_buffer import ReplayBuffer
#####################  hyper parameters  ####################

MAX_EPISODES = 200
MAX_EP_STEPS = 200
LR_A = 0.001    # learning rate for actor
LR_C = 0.0001    # learning rate for critic
GAMMA = 0.9     # reward discount
TAU = 0.01      # soft replacement
MEMORY_CAPACITY = 1000000#10000
BATCH_SIZE = 64#32

BOUND=200000
RENDER = False


REPLAY_BUFFER_SIZE = 1000000
REPLAY_START_SIZE = 10000
BATCH_SIZE = 64
GAMMA = 0.99

###############################  DDPG  ####################################

class DDPG:
    """docstring for DDPG"""


    def __init__(self, a_dim, s_dim):
        self.name = 'DDPG'  # name for uploading results
        # self.environment = env
        # Randomly initialize actor network and critic network
        # with both their target networks
        self.state_dim = s_dim
        self.action_dim = a_dim
        self.time_step=0
        self.max_bw = 0.0
        self.max_cwnd = 0.0
        self.min_rtt = 9999999.0

        self.sess = tf.InteractiveSession()

        self.actor_network = ActorNetwork(self.sess, self.state_dim, self.action_dim)
        self.critic_network = CriticNetwork(self.sess, self.state_dim, self.action_dim)

        # initialize replay buffer
        self.replay_buffer = ReplayBuffer(REPLAY_BUFFER_SIZE)

        # Initialize a random process the Ornstein-Uhlenbeck process for action exploration
        self.exploration_noise = OUNoise(self.action_dim)

    def learn(self):
        # print "train step",self.time_step
        # Sample a random minibatch of N transitions from replay buffer
        minibatch = self.replay_buffer.get_batch(BATCH_SIZE)
        state_batch = np.asarray([data[0] for data in minibatch])
        action_batch = np.asarray([data[1] for data in minibatch])
        reward_batch = np.asarray([data[2] for data in minibatch])
        next_state_batch = np.asarray([data[3] for data in minibatch])
        done_batch = np.asarray([data[4] for data in minibatch])

        # for action_dim = 1
        action_batch = np.resize(action_batch, [BATCH_SIZE, self.action_dim])

        # Calculate y_batch

        next_action_batch = self.actor_network.target_actions(next_state_batch)
        q_value_batch = self.critic_network.target_q(next_state_batch, next_action_batch)
        y_batch = []
        for i in range(len(minibatch)):
            if done_batch[i]:
                y_batch.append(reward_batch[i])
            else:
                y_batch.append(reward_batch[i] + GAMMA * q_value_batch[i])
        y_batch = np.resize(y_batch, [BATCH_SIZE, 1])
        # Update critic by minimizing the loss L
        self.critic_network.train(y_batch, state_batch, action_batch)

        # Update the actor policy using the sampled gradient:
        action_batch_for_gradients = self.actor_network.actions(state_batch)
        q_gradient_batch = self.critic_network.gradients(state_batch, action_batch_for_gradients)

        self.actor_network.train(q_gradient_batch, state_batch)

        # Update the target networks
        self.actor_network.update_target()
        self.critic_network.update_target()

    def noise_action(self, state):
        self.time_step += 1
        # Select action a_t according to the current policy and exploration noise
        action = self.actor_network.action(state)
        noise = self.exploration_noise.noise()
        # print("noise:" + str(noise))
        return action + noise

    def choose_action(self, state):
        self.time_step += 1
        # print("_______________________choose_action_____________________")
        action = self.actor_network.action(state)
        return action

    def store_transition(self, s, a, r, s_,done,episode_count):

        # Store transition (s_t,a_t,r_t,s_{t+1}) in replay buffer
        # print("*********************************ADD****************************")
        self.replay_buffer.add(s, a, r, s_, done)

        # Store transitions to replay start size then start training
        if self.replay_buffer.count() > REPLAY_START_SIZE:
            if((episode_count+1)%100!= 0):
                self.learn()
                # print("learn!")
            else:
                self.actor_network.save_network(self.time_step)
                self.critic_network.save_network(self.time_step)


        # Re-iniitialize the random process when an episode ends
        if done:
            self.exploration_noise.reset()

    def extract_observation(self,dataRecorder,subflow_index,state_before):
        # print("extracting...")
        value_dic = dataRecorder.get_latest_data()
        state_after=state_before.reshape(10,5)
        # observation = np.zeros((4))
        observation = np.zeros((5))
        t_cWnd=[0,0]
        t_thr=[0,0]
        t_rtt=[0,0]
        t_loss_rate=[0,0]
        t_unAck=[0,0]
        s0=[0,0,0,0,0]
        state=np.zeros(1)
        for i in range(value_dic["nbOfSubflows"]):
            name = "cWnd" + str(i)
            t_cWnd[i] = value_dic[name]
            name = "rtt"+str(i)
            t_rtt[i] = value_dic[name]
            name = "unAck" + str(i)
            t_unAck[i]=value_dic[name]
            name = "loss_rate" + str(i)
            t_loss_rate[i]=value_dic[name]
            name = "throughput" + str(i)
            t_thr[i]=value_dic[name]

        thr=t_thr[subflow_index]
        s0[0]=t_thr[subflow_index]

        rtt=t_rtt[subflow_index]
        s0[1]=t_rtt[subflow_index]

        cwnd=t_cWnd[subflow_index]
        s0[2]=t_cWnd[subflow_index]

        loss_rate=t_loss_rate[subflow_index]
        s0[3]=t_loss_rate[subflow_index]

        unAck=t_unAck[subflow_index]
        s0[4]=t_unAck[subflow_index]


        s0=np.array(s0)
        min_=s0-s0

        thr_n=s0[0]
        thr_n_min=s0[0]-min_[0]
        rtt_min=s0[1]-min_[1]
        cwnd_n_min=s0[2]-min_[2]
        loss_rate_n_min=s0[3]-min_[3]
        unAck_n_min=s0[4]-min_[4]

        # loss_rate_n_min=s0[7]-min_[7]

        if self.max_bw<thr_n_min:
            self.max_bw=thr_n_min
        if self.max_cwnd<cwnd_n_min:
            self.max_cwnd=cwnd_n_min
        if self.max_cwnd<cwnd_n_min:
            self.max_cwnd=cwnd_n_min
        if self.min_rtt>rtt_min:
            self.min_rtt=rtt_min

        
        reward  = thr_n_min-1*(rtt_min-self.min_rtt)-1000*loss_rate_n_min
        print("reward:"+str(reward)+" thr_n_min:"+str(thr_n_min)+ " rtt_min:"+str(rtt_min)+" self.min_rtt :"+str(self.min_rtt)+"  delta_rtt"+str(rtt_min-self.min_rtt))
        print("unAck:"+str(unAck_n_min))
        if self.max_bw!=0:
            state[0]=thr_n_min/self.max_bw
            # tmp=pacing_rate_n_min/self.max_bw
            state=np.append(state,[5*loss_rate_n_min])
            state=np.append(state,[unAck_n_min])
        else:
            state[0]=0
            state=np.append(state,[0])
            state=np.append(state,[0])
        state=np.append(state,[1400/cwnd])
        state=np.append(state,[self.min_rtt/rtt_min])

        state_after=np.delete(state_after,[0],axis = 0)
        state_after=np.append(state_after,state)
        

        return state_after,reward,thr_n_min,rtt_min



class Normalizer():
    def __init__(self):
        self.n = 1e-5
        num_inputs = 5
        self.mean = np.zeros(num_inputs)
        self.mean_diff = np.zeros(num_inputs)
        self.var = np.zeros(num_inputs)
        self.dim = num_inputs
        self.min = np.zeros(num_inputs)


    def observe(self, x):
        self.n += 1
        last_mean = np.copy(self.mean)
        self.mean += (x-self.mean)/self.n
        self.mean_diff += (x-last_mean)*(x-self.mean)
        self.var = self.mean_diff/self.n

    def normalize(self, inputs):
        obs_std = np.sqrt(self.var)
        a=np.zeros(self.dim)
        if self.n > 2:
            a=(inputs - self.mean)/obs_std
            for i in range(0,self.dim):
                if a[i] < self.min[i]:
                    self.min[i] = a[i]
            return a
        else:
            return np.zeros(self.dim)

    def normalize_delay(self,delay):
        obs_std = math.sqrt(self.var[0])
        if self.n > 2:
            return (delay - self.mean[0])/obs_std
        else:
            return 0

    def stats(self):
        return self.min


omega=0.5







    


# #这个函数是我毕业设计的直接获取两条流的state进行训练的状态提取函数
def extract_observation_mptcp_version(dataRecorder,OldSeqNum,OldAckTime,OldAckTime2,I):
    # let's set return value "observation" to be a np array with fixed length
    print("extracting...")
    value_dic = dataRecorder.get_latest_data()
    print(value_dic)
    observation = np.zeros((10))
    cWnd=[0,0]
    rtt=[0,0]
    state=[0,0]
    inFlight=[0,0]
    for i in range(value_dic["nbOfSubflows"]):

        name = "lastAckedSeq" + str(i)

        if value_dic[name] > OldSeqNum[i] :
            OldAckTime2[i]=OldAckTime[i]
            OldAckTime[i]=value_dic["time"]
            OldSeqNum[i]=value_dic[name]
        # I[i]=(I[i]*omega+(1-omega)*(OldAckTime[i]-OldAckTime2[i]))/10000000

        # print("window"+str(i)+": "+str(value_dic[name]))
        name = "cWnd" + str(i)
        cWnd[i] = value_dic[name]
        name = "rtt"+str(i)
        rtt[i] = value_dic[name]
        print("I" + str(i) + ":" + str(I[i]) + "*0.5 + 0.5*(" + str(rtt[i] / 10000000) + ")")
        I[i] = (I[i] * omega+ (1 - omega) * rtt[i]/ 10000000)

        name = "state"+str(i)
        state[i]=1
        name = "unAck" + str(i)
        inFlight[i]=value_dic[name]

    observation[0] = I[0]
    if rtt[0]>0 and rtt[1]>0 and cWnd[0]>0 and cWnd[1]>0:
        observation[1] = (cWnd[0]/rtt[0])/((cWnd[0]/rtt[0])+cWnd[1]/rtt[1])
    observation[2] = I[1]
    if rtt[0] > 0 and rtt[1] > 0 and cWnd[0]>0 and cWnd[1]>0:
        observation[3] = (cWnd[1] / rtt[1]) / ((cWnd[0] / rtt[0]) + cWnd[1] / rtt[1])

    sc = BOUND - 0
    o_c = (BOUND) / 2.
    o_sc = sc / 2.
        # print("obs::"+str(obs))
        # print((obs-o_c) /o_sc)
    observation[4]=(cWnd[0]-o_c)/o_sc
    observation[5]=(cWnd[1]-o_c)/o_sc

    observation[6]=state[0]
    observation[7]=state[1]

    observation[8] = inFlight[0]/1000000
    observation[9] = inFlight[1]/1000000



        # print("cWnd:" + str(i) + ": " + str(value_dic[name]))
        # name = "rtt" + str(i)
        # observation[i * 2 + 2] = value_dic[name]
    return observation,1500,OldAckTime,OldAckTime2,I

def extract_ssThresh(dataRecorder):
    # let's set return value "observation" to be a np array with fixed length
    value_dic = dataRecorder.get_latest_data()
    ssThresh = np.zeros((2))
    # for i in range(value_dic["nbOfSubflows"]):
    #     name = "ssThresh" + str(i)
    #     ssThresh[i] = value_dic[name]
    #     # name = "rtt" + str(i)
    #     # observation[i * 2 + 2] = value_dic[name]
    cwnd = np.zeros((2))
    for i in range(value_dic["nbOfSubflows"]):
        name = "cWnd" + str(i)
        cwnd[i] = value_dic[name]
        # name = "rtt" + str(i)
        # observation[i * 2 + 2] = value_dic[name]
        # segmentSize=value_dic["seg"]
    return cwnd,2000

def action_translator(dataRecorder, action):
    # action is a numpy array, so we need translator
    # let's set return value "action" to be an integer
    # 0 choose subflow 0
    # 1 choose subflow 1
    # 2 choose subflow 2
    # print type(action), action
    return "["+str(int(action[0]))+"]"

def apply_action(interacter_socket, dataRecorder, action,segmentSize,cwnd1,cwnd2,ssThresh):
    # print("apply_action:cwnd:"+str(cwnd1)+","+str(cwnd2)+" ssThresh:"+str(ssThresh))
    dataRecorder.action.append(action)
    action2=action


    if action[0]== -999:
        tx_str = "[-999,-999]"
    else:
        # if action[0]<0 :
        #     action[0]=-action[0]
        # if action[1]<0 :
        #     action[1]=-action[1]
        action_apply=action*2
        # print("is goint to use"+str(action_apply))
        # if(cwnd1>3000):
        #     # new_cWnd1 = cwnd1 + np.int((cwnd1 * 1.0 / segmentSize) * action[0]) * segmentSize
        #     new_cWnd1 = int(BOUND*action_apply[0])
        #     if new_cWnd1 <segmentSize:
        #         new_cWnd1 = segmentSize
        # else:
        #     new_cWnd1=cwnd1*2
        #     # action2[0]=1
        #     action2[0]=2*(new_cWnd1/BOUND-0.5)
        # if(cwnd2>3000):
        #     # new_cWnd2 = cwnd2 + np.int((cwnd2 * 1.0 / segmentSize) * action[1]) * segmentSize
        #     new_cWnd2 = int(BOUND * action_apply[1])
        #     if new_cWnd2 <segmentSize:
        #         new_cWnd2 = segmentSize
        # else:
        #     new_cWnd2=cwnd2*2
        #     # action2[1]=1
        #     action2[1] =2*(new_cWnd2 / BOUND-0.5)

        new_cWnd1 = cwnd1*math.pow(4,action)
        # new_cWnd2 = int(BOUND * action_apply[1])



        action = [int(new_cWnd1)]
        action = np.clip(action,segmentSize,BOUND)


        # print("action sent:" + str(action))
        tx_str = action_translator(dataRecorder, action)




    # print(tx_str)
    # print dataRecorder.get_latest_subflow_data()
    # print '-- apply action: dfdfddf'
    # print(tx_str+" over")
    interacter_socket.send(tx_str) # apply action
    return action2





# def calculate_reward(dataRecorder, reset = False):
#     if reset == False:
#         last_record = dataRecorder.get_latest_data()
#         # print last_record
#         # print '--calculate_reward'
#         # print 'old lastAckedSeqSum == ', calculate_reward.lastAckedSeqSum
#         reward = 0
#         for i in range(last_record['nbOfSubflows']):
#             reward += last_record["lastAckedSeq" + str(i)]
#         reward -= calculate_reward.lastAckedSeqSum

#         calculate_reward.lastAckedSeqSum = 0
#         for i in range(last_record['nbOfSubflows']):
#             calculate_reward.lastAckedSeqSum += last_record["lastAckedSeq" + str(i)]

#         # if dataRecorder.action or dataRecorder.action[-1] != 'not send':
#         #     reward -= 10
#         # print 'new lastAckedSeqSum == ', calculate_reward.lastAckedSeqSum
#         # print 'reward == ' + str(reward)
#         return reward
#         # don't condiser seq_num wrap
#     else:
#         # print 'In last episode, calculate_reward.lastAckedSeqSum == ', calculate_reward.lastAckedSeqSum
#         calculate_reward.lastAckedSeqSum = 0

# calculate_reward.lastAckedSeqSum = 0



lastAckedSeq=[0,0]


def calculate_reward(dataRecorder, reset = False):
    if reset == False:
        last_record = dataRecorder.get_latest_data()
        # print last_record
        # print '--calculate_reward'
        # print 'old lastAckedSeqSum == ', calculate_reward.lastAckedSeqSum
        reward = 0

        throughput=[0,0]
        totalThpt1=0
        totalThpt2=0
        for i in range(last_record['nbOfSubflows']):
            reward += last_record["lastAckedSeq" + str(i)]
            # print("subflow:"+str(i)+" lastAckedSeq:"+str(last_record["lastAckedSeq" + str(i)]))
            throughput[i]=(last_record["lastAckedSeq" + str(i)]-calculate_reward.lastAckedSeq[i])/0.1
            calculate_reward.lastAckedSeq[i]=last_record["lastAckedSeq" + str(i)]


        reward -= calculate_reward.lastAckedSeqSum
        totalThpt1 = last_record["lastAckedSeq0"]/30/ 1418.0
        if last_record['nbOfSubflows'] ==2 :
            totalThpt2 = last_record["lastAckedSeq1"]/30/ 1418.0


        calculate_reward.lastAckedSeqSum = 0
        for i in range(last_record['nbOfSubflows']):
            calculate_reward.lastAckedSeqSum += last_record["lastAckedSeq" + str(i)]

        # if dataRecorder.action or dataRecorder.action[-1] != 'not send':
        #     reward -= 10
        # print 'new lastAckedSeqSum == ', calculate_reward.lastAckedSeqSum
        # print 'reward == ' + str(reward)
        # print("throughput:"+str(reward / 1418.0))

        rtt=0
        for i in range(last_record['nbOfSubflows']):
            rtt += np.log(last_record["rtt" + str(i)])

        # print("reward:" + str(reward / 1418.0-rtt/100000))
        return reward / 1418.0,throughput,totalThpt1,totalThpt2

        # don't condiser seq_num wrap
    else:
        # print 'In last episode, calculate_reward.lastAckedSeqSum == ', calculate_reward.lastAckedSeqSum
        calculate_reward.lastAckedSeqSum = 0
        calculate_reward.lastAckedSeq = [0, 0]
calculate_reward.lastAckedSeqSum = 0
