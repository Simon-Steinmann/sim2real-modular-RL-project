import copy
import random
import gym
import numpy as np
from gym import spaces
from gym.utils import seeding
from environments.proxy_gym_env import ProxyGymEnv


class j2n6s300_Environment(gym.Env):
    environment_name = "Jaco Proxy Env Her"

    def __init__(self, deterministic=False):
        self.env = ProxyGymEnv()
        self.action_space = spaces.Discrete(12)
        self.observation_space = spaces.Dict(dict(
            desired_goal=spaces.Box(-np.full((3),2) , np.full((3),2), dtype='float32'),
            achieved_goal=spaces.Box(-np.full((3),2) , np.full((3),2), dtype='float32'),
            observation=spaces.Box(-np.full((56),2) , np.full((56),2), dtype='float32'),
        ))

        self.seed()
        self.reward_threshold = 320
        self.trials = 10
        self.max_episode_steps = 360
        self.id = "Jaco Proxy Env Her"
        self.reward_for_achieving_goal = 360
        self.step_reward_for_not_achieving_goal = -1

        self.deterministic = deterministic

    def seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]

    def reset(self):
        obs = np.asarray(self.env.reset())
        target_point = self.env.get_variable('target_point')
        self.des_goal = np.array(target_point)
        return {"observation": obs, "desired_goal": self.des_goal,
                "achieved_goal": obs[48:51]}

    def step(self, action):
        obs, self.reward, self.done, info = self.env.step(action)  
        obs = np.asarray(obs)
        for i in range(7):
            if obs[i*8+2] < 0.08:
                ground_collide = True                
            else: 
                ground_collide = False
        self.reward = self.compute_reward(obs[48:51], self.des_goal, info)
        if self.done:
            if ground_collide:
                self.reward = self.step_reward_for_not_achieving_goal
            
        #print(self.reward)  
        #print(obs[18])
        return {"observation": obs, "desired_goal": self.des_goal,
                "achieved_goal": obs[48:51]}, self.reward, self.done, {}

    def goal_achieved(self, next_state):
        return next_state[:self.environment_dimension] == next_state[-self.environment_dimension:]

    def compute_reward(self, achieved_goal, desired_goal, info):
        """Computes the reward we would have got with this achieved goal and desired goal. Must be of this exact
        interface to fit with the open AI gym specifications"""
        deltax = achieved_goal[0]-desired_goal[0]
        deltay = achieved_goal[1]-desired_goal[1]
        deltaz = achieved_goal[2]-desired_goal[2]
        distance = (deltax**2+deltay**2+deltaz**2)**0.5
        if distance < 0.1:
            reward = self.reward_for_achieving_goal
            self.done = True
        else:
            reward = self.step_reward_for_not_achieving_goal
        return reward
