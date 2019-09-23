#!/usr/bin/env python3
'''
import sys
sys.path = ['/home/simon/simon/anaconda3/envs/37/lib/python3.7/site-packages', 
            '/home/simon/sim2real_project/catkin_ws/devel/lib/python3/dist-packages', 
            '/opt/ros/melodic/lib/python2.7/dist-packages', 
            '/home/simon/anaconda3/envs/37/lib/python37.zip', 
            '/home/simon/anaconda3/envs/37/lib/python3.7', 
            '/home/simon/anaconda3/envs/37/lib/python3.7/lib-dynload', 
            '/home/simon/anaconda3/envs/37/lib/python3.7/site-packages', 
            '/home/simon/sim2real_project/catkin_ws/src/ml_using_tf/scripts', 
            '/home/simon/sim2real_project/catkin_ws/src/baselines',
            '/home/simon/sim2real_project/Deep-Reinforcement-Learning-Algorithms-with-PyTorch']

'''


import gym
import rospy
#from ml_using_tf.scripts import task_env_tf
from environments.j2n6s300 import task_env_tf
from baselines import deepq


def callback(lcl, _glb):
    # stop training if reward exceeds 199
    is_solved = lcl['t'] > 100 and sum(lcl['episode_rewards'][-101:-1]) / 100 >= 199
    return is_solved


def main():    
    rospy.init_node('jaco2_training1', anonymous=True, log_level=rospy.WARN)
    env = gym.make("j2n6s300Test-v6")
    print(env)
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
