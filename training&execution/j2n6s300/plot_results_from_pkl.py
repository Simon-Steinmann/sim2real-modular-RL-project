# -*- coding: utf-8 -*-
"""
Created on Fri Oct 11 22:39:42 2019

@author: kashishg
"""

# -*- coding: utf-8 -*-

import pickle
import matplotlib.pyplot as plt

data_file = open("../results/data_and_graphs/Data.pkl","rb")
data_complex_file = open("../results/data_and_graphs/Complexity_Goal_Data.pkl","rb")

data = pickle.load(data_file)
data_complex = pickle.load(data_complex_file)

num_episodes = 2500
#plt.plot(data["DQN"][0][1][0:num_episodes-1], label = "DQN")
plt.plot(data["DQN-HER"][0][1][0:num_episodes-1], label = "DQN-HER")
#plt.plot(data_complex["DQN"][0][1][0:num_episodes-1], label = "DQN-CG")
plt.plot(data_complex["DQN-HER"][0][1][0:num_episodes-1], label = "DQN-HER-CG")
plt.title("Bit Flipping Environment")
plt.xlabel("Number of Episodes")
plt.ylabel("Cumulative reward")
plt.legend()

data_file.close()
data_complex_file.close()

# CG - Conditioned Goal
