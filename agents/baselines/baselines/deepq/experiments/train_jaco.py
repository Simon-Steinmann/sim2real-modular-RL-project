#!/usr/bin/env python3

import sys
sys.path = ['/home/simon/simon/anaconda3/envs/37/lib/python3.7/site-packages', 
            #'/home/simon/sim2real_project/catkin_ws/devel/lib/python3/dist-packages', 
            '/opt/ros/melodic/lib/python2.7/dist-packages', 
            '/home/simon/anaconda3/envs/37/lib/python37.zip', 
            '/home/simon/anaconda3/envs/37/lib/python3.7', 
            '/home/simon/anaconda3/envs/37/lib/python3.7/lib-dynload', 
            '/home/simon/anaconda3/envs/37/lib/python3.7/site-packages', 
            '/home/simon/sim2real/agents/baselines/',
            '/home/simon/sim2real'
            ]




import gym
#from ml_using_tf.scripts import task_env_tf
#from environments.j2n6s300 import task_env_tf
from environments.proxy_gym_env import ProxyGymEnv
from baselines import deepq
import numpy

def callback(lcl, _glb):
    # stop training if reward exceeds 199
    is_solved = lcl['t'] > 100 and sum(lcl['episode_rewards'][-101:-1]) / 100 >= 199
    return is_solved


def main():    
    action_space = gym.spaces.Discrete(12)
    observation_space = gym.spaces.Box(-numpy.full((48),2) , numpy.full((48),2) )
    env = ProxyGymEnv(action_space=action_space, observation_space=observation_space)
    act = deepq.learn(
        env,
        network='mlp',
        lr=1e-3,
        total_timesteps=5000,
        buffer_size=50000,
        exploration_fraction=0.1,
        exploration_final_eps=0.02,
        print_freq=10,
        callback=callback
    )
    print("Saving model to cartpole_model.pkl")
    act.save("cartpole_model.pkl")


if __name__ == '__main__':    
    main()
