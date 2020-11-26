import numpy as np
import pandas as pd
import os
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
        print("noise:" + str(noise))
        return action + noise

    def choose_action(self, state):
        self.time_step += 1
        print("_______________________choose_action_____________________")
        action = self.actor_network.action(state)
        return action

    def store_transition(self, s, a, r, s_,done,episode_count):

        # Store transition (s_t,a_t,r_t,s_{t+1}) in replay buffer
        self.replay_buffer.add(s, a, r, s_, done)

        # Store transitions to replay start size then start training
        if self.replay_buffer.count() > REPLAY_START_SIZE:
            if((episode_count+1)%100!= 0):
                self.learn()
                print("learn!")
            else:
                self.actor_network.save_network(self.time_step)
                self.critic_network.save_network(self.time_step)


        # Re-iniitialize the random process when an episode ends
        if done:
            self.exploration_noise.reset()
# class DDPG(object):
#     def __init__(self, a_dim, s_dim, a_bound,model_dir):
#         self.memory = np.zeros((MEMORY_CAPACITY, s_dim * 2 + a_dim + 1), dtype=np.float32)
#         self.pointer = 0
#         self.sess = tf.Session()
#         self.model_dir = model_dir
#         self.learn_step_counter= 0
#
#         self.a_dim, self.s_dim, self.a_bound = a_dim, s_dim, a_bound,
#         self.S = tf.placeholder(tf.float32, [None, s_dim], 's')
#         self.S_ = tf.placeholder(tf.float32, [None, s_dim], 's_')
#         self.R = tf.placeholder(tf.float32, [None, 1], 'r')
#
#         with tf.variable_scope('Actor'):
#             self.a = self._build_a(self.S, scope='eval', trainable=True)
#             a_ = self._build_a(self.S_, scope='target', trainable=False)
#         with tf.variable_scope('Critic'):
#             # assign self.a = a in memory when calculating q for td_error,
#             # otherwise the self.a is from Actor when updating Actor
#             q = self._build_c(self.S, self.a, scope='eval', trainable=True)
#             q_ = self._build_c(self.S_, a_, scope='target', trainable=False)
#
#         # networks parameters
#         self.ae_params = tf.get_collection(tf.GraphKeys.GLOBAL_VARIABLES, scope='Actor/eval')
#         self.at_params = tf.get_collection(tf.GraphKeys.GLOBAL_VARIABLES, scope='Actor/target')
#         self.ce_params = tf.get_collection(tf.GraphKeys.GLOBAL_VARIABLES, scope='Critic/eval')
#         self.ct_params = tf.get_collection(tf.GraphKeys.GLOBAL_VARIABLES, scope='Critic/target')
#
#         # target net replacement
#         self.soft_replace = [tf.assign(t, (1 - TAU) * t + TAU * e)
#                              for t, e in zip(self.at_params + self.ct_params, self.ae_params + self.ce_params)]
#
#         q_target = self.R + GAMMA * q_
#         # in the feed_dic for the td_error, the self.a should change to actions in memory
#         td_error = tf.losses.mean_squared_error(labels=q_target, predictions=q)
#         self.ctrain = tf.train.AdamOptimizer(LR_C).minimize(td_error, var_list=self.ce_params)
#
#         a_loss = - tf.reduce_mean(q)    # maximize the q
#         self.atrain = tf.train.AdamOptimizer(LR_A).minimize(a_loss, var_list=self.ae_params)
#
#         self.sess.run(tf.global_variables_initializer())
#         self.saver = tf.train.Saver()
#
#         if not os.path.exists(self.model_dir):
#             os.mkdir(self.model_dir)
#
#         checkpoint = tf.train.get_checkpoint_state(self.model_dir)
#         if checkpoint and checkpoint.model_checkpoint_path:
#             self.saver.restore(self.sess,checkpoint.model_checkpoint_path)
#             print("Loading successfully")
#             sleep(3)
#             self.learn_step_counter = int(checkpoint.model_checkpoint_path.split('-')[-1])+1
#
#     def choose_action(self, s):
#         return self.sess.run(self.a, {self.S: s[np.newaxis, :]})[0]
#
#     def learn(self):
#         # soft target replacement
#         self.sess.run(self.soft_replace)
#
#         indices = np.random.choice(MEMORY_CAPACITY, size=BATCH_SIZE)
#         bt = self.memory[indices, :]
#         bs = bt[:, :self.s_dim]
#         ba = bt[:, self.s_dim: self.s_dim + self.a_dim]
#         br = bt[:, -self.s_dim - 1: -self.s_dim]
#         bs_ = bt[:, -self.s_dim:]
#
#         self.sess.run(self.atrain, {self.S: bs})
#         self.sess.run(self.ctrain, {self.S: bs, self.a: ba, self.R: br, self.S_: bs_})
#         self.learn_step_counter += 1
#         if self.learn_step_counter%400:
#             self.saver.save(self.sess,"/home/hong/model/",global_step=self.learn_step_counter)
#
#
#
#
#     def store_transition(self, s, a, r, s_):
#         transition = np.hstack((s, a, [r], s_))
#         index = self.pointer % MEMORY_CAPACITY  # replace the old memory with new memory
#         self.memory[index, :] = transition
#         self.pointer += 1
#
#     def _build_a(self, s, scope, trainable):
#         with tf.variable_scope(scope):
#             net = tf.layers.dense(s, 30, activation=tf.nn.relu, name='l1', trainable=trainable)
#             a = tf.layers.dense(net, self.a_dim, activation=tf.nn.tanh, name='a', trainable=trainable)
#             return tf.multiply(a, self.a_bound, name='scaled_a')
#
#     def _build_c(self, s, a, scope, trainable):
#         with tf.variable_scope(scope):
#             n_l1 = 30
#             w1_s = tf.get_variable('w1_s', [self.s_dim, n_l1], trainable=trainable)
#             w1_a = tf.get_variable('w1_a', [self.a_dim, n_l1], trainable=trainable)
#             b1 = tf.get_variable('b1', [1, n_l1], trainable=trainable)
#             net = tf.nn.relu(tf.matmul(s, w1_s) + tf.matmul(a, w1_a) + b1)
#             return tf.layers.dense(net, 1, trainable=trainable)  # Q(s,a)
#
#


omega=0.5

def extract_observation(dataRecorder,OldSeqNum,OldAckTime,OldAckTime2,I):
    # let's set return value "observation" to be a np array with fixed length
    print("extracting...")
    value_dic = dataRecorder.get_latest_data()
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
        state[i]=value_dic[name]
        name = "inFlight" + str(i)
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
    return observation,value_dic["segmentSize"],OldAckTime,OldAckTime2,I

def extract_ssThresh(dataRecorder):
    # let's set return value "observation" to be a np array with fixed length
    value_dic = dataRecorder.get_latest_data()
    ssThresh = np.zeros((2))
    for i in range(value_dic["nbOfSubflows"]):
        name = "ssThresh" + str(i)
        ssThresh[i] = value_dic[name]
        # name = "rtt" + str(i)
        # observation[i * 2 + 2] = value_dic[name]
    cwnd = np.zeros((2))
    for i in range(value_dic["nbOfSubflows"]):
        name = "cWnd" + str(i)
        cwnd[i] = value_dic[name]
        # name = "rtt" + str(i)
        # observation[i * 2 + 2] = value_dic[name]
    return cwnd,ssThresh

def action_translator(dataRecorder, action):
    # action is a numpy array, so we need translator
    # let's set return value "action" to be an integer
    # 0 choose subflow 0
    # 1 choose subflow 1
    # 2 choose subflow 2
    # print type(action), action
    return "["+str(int(action[0]))+","+str(int(action[1]))+"]"

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
        action_apply=action/2+0.5
        print("is goint to use"+str(action_apply))
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

        new_cWnd1 = int(BOUND * action_apply[0])
        new_cWnd2 = int(BOUND * action_apply[1])



        action = [int(new_cWnd1), int(new_cWnd2)]
        action = np.clip(action,segmentSize,BOUND)


        print("action sent:" + str(action))
        tx_str = action_translator(dataRecorder, action)




    # print(tx_str)
    # print dataRecorder.get_latest_subflow_data()
    # print '-- apply action: dfdfddf'
    print(tx_str+" over")
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
            print("subflow:"+str(i)+" lastAckedSeq:"+str(last_record["lastAckedSeq" + str(i)]))
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
