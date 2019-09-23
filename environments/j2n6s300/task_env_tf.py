# saved as greeting-client.py
import Pyro4
import gym
import numpy
import os

# All you have to define are the following 4 variables
environment_id = 'j2n6s300Test-v5'
action_space = gym.spaces.Discrete(12)
observation_space = gym.spaces.Box(-numpy.full((48),2) , numpy.full((48),2) )
entry_point='environments.j2n6s300.task_env_tf:ProxyGymEnv'
# -----------------------------------------------





path = os.path.dirname(os.path.abspath(__file__))
print(path)
path = os.path.abspath(__file__)
print(os.path.splitext(path)[0])
exists = False
for env in gym.envs.registry.all():
    if env.id == environment_id: 
        exists = True   
if not exists:
    
    gym.register(
                id=environment_id,
                entry_point=entry_point )



class ProxyGymEnv(gym.Env):
    def __init__(self):
        self.ProxyEnv = Pyro4.Proxy("PYRONAME:GymEnvProxy.Env1")  
        
        self.action_space = action_space          
        self.observation_space = observation_space
        
        
    def seed(self, seed=None):
        seed = self.ProxyEnv.seed()
        return seed
        

    def step(self, action):
        obs, reward, done, info = self.ProxyEnv.step(float(action))        
        return obs, reward, done, info
        

    def reset(self):
        obs = self.ProxyEnv.reset()
        return obs


    def close(self):
        self.ProxyEnv.close()

