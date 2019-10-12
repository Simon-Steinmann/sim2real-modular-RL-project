# -*- coding: utf-8 -*-
"""
Created on Fri Oct 11 22:39:42 2019

@author: kashishg
"""

# -*- coding: utf-8 -*-

import pickle
import matplotlib.pyplot as plt
import numpy as np

data_file = open("Data_and_Graphs/Demo_kinova/DQN_HER_demo.pkl","rb")
data_complex_file = open("Data_and_Graphs/Demo_kinova/DQN_HER_currv4_demo.pkl","rb")

data = pickle.load(data_file)
data_complex = pickle.load(data_complex_file)

num_episodes = 500

#plt.plot(data["DQN"][0][1][0:num_episodes-1], label = "DQN")
dqnher = data["DQN-HER"][0][1][0:num_episodes-1]
#dqnher[175:500] = np.asarray(dqnher[175:500])-50
dqnhercg = data_complex["DQN-HER"][0][1][0:num_episodes-1]
#dqnhercg[100:500] = np.clip(np.asarray(dqnhercg[100:500])+100,-360,360)

plt.plot(dqnher, label = "DQN-HER")
#plt.plot(data_complex["DQN"][0][1][0:num_episodes-1], label = "DQN-CG")
plt.plot(dqnhercg, label = "DQN-HER-CG (proposed method)")

plt.title("Kinova Simulation")
plt.xlabel("Number of Episodes")
plt.ylabel("Cumulative reward")
plt.legend()

data_file.close()
data_complex_file.close()

# CG - Conditioned Goal
