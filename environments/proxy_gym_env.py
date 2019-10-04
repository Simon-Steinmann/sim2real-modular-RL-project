# saved as greeting-client.py
import Pyro4
import gym
import numpy

'''
To implement the proxy gym environment all you have to do is the following:
    
from environments.proxy_gym_env import ProxyGymEnv
action_space = <your action space>
observation_space = <your observation space>
env = ProxyGymEnv(action_space=action_space, observation_space=observation_space)

metadata, reward_range and spec can be implemented in the same manner. Be carefull
that you only send standard python objects and data through the proxy. For example
sending a numpy array does not work. Turn it into a python list before sending it.

The proxy Env only works if you have the proxy server running on the simulation side.
To implement this, have a look at the included simulation-side template
'''

class ProxyGymEnv(gym.Env):
    def __init__(self, 
                 proxyID='Env1',
                 action_space = None, 
                 observation_space = None, 
                 metadata = {'render.modes': []},
                 reward_range = (-float('inf'), float('inf')),
                 spec = None,
                 ):
        
        self.action_space = action_space
        self.observation_space = observation_space
        self.metadata = metadata
        self.reward_range = reward_range
        self.spec = spec    
        
        print(proxyID)
        self.id="ProxyGymEnv-v0"                                                                          
        self.ProxyEnv = Pyro4.Proxy("PYRONAME:GymEnvProxy."+proxyID)  

        
    def seed(self, seed=None):
        seed = self.ProxyEnv.seed()
        return seed
        

    def step(self, action):
        if type(action) == int: #discreet actions
            obs, reward, done, info = self.ProxyEnv.step(float(action))
        else:
            #make sure the action is a list
            action = numpy.array(action)
            action = action.tolist()
            obs, reward, done, info = self.ProxyEnv.step(action)  #continuous action  
        return obs, reward, done, info
        

    def reset(self):
        obs = self.ProxyEnv.reset()
        return obs


    def close(self):
        self.ProxyEnv.close()
        
    def render(self, mode='human'):
        #this method might not work with the Proxy Env. look at Pyro4 documentation
        render = self.ProxyEnv.render()
        return render
    
    def get_variable(self, var_name): #get the value of a variable in the proxy environment
        value = self.ProxyEnv.get_variable(var_name)
        return(value)
    
    def set_variable(self, var_name, value):
        self.ProxyEnv.set_variable(var_name, value)  

