#! /usr/bin/env python
import Pyro4
import gym
import threading
from Pyro4 import naming

# You have two options: 
# 1. you create a custom environment class that contains the functions: 
# step(action), reset(), close()
# 2. input the id of a gym Environment you wish to use

# Set Option 1 or 2
Option = 1

# Option 1: 
# Import your class
if Option == 1:
    from task_env_continous_actions import j2n6s300TestEnv as option1class

# Option 2: 
# Set the environment ID
env_id = 'j2n6s300Test-v0'

#-----------------------------------------------------------------------------
#---------------Init Area - run any code you want to initialize once here-----
#-----------------------------------------------------------------------------
import rospy #for exmaple when using ros, you can start a rosnode
rospy.init_node('j2n6s300_gym', anonymous=True, log_level=rospy.WARN)
rospy.sleep(1)
rospy.logwarn('starting ProxyEnv Node')
print('derp')





#-----------------------------------------------------------------------------
#-------DONE! You dont have to touch any of the code below--------------------
#-----------------------------------------------------------------------------





# Here the Option 2 class is defined
if Option == 2:
    env = gym.make(env_id)
class option2class(gym.Env):

    def seed(self, seed=None):
        seed = env.seed()
        return seed
        

    def step(self, action):
        obs, reward, done, info = env.step(float(action))        
        return obs, reward, done, info
        

    def reset(self):
        obs = env.reset()
        return obs


    def close(self):
        env.close()
        
        
    def get_variable(self, var_name): # make sure only standart python types are used
        return(vars(env).get(var_name))
        
        
    def set_variable(self, var_name, value): # make sure only standart python types are used
        dic = vars(env)
        dic[var_name] = value
        
#-----------------------------------------------------------------------------
#---------------------Convert our Class to ProxyClass-------------------------
#-----------------------------------------------------------------------------
        
class NameServer(object):
    def __init__(self):
        thread = threading.Thread(target=self.start_name_server)
        thread.start()

    def start_name_server(self):
        while True:
            try: 
                print("Creating new Pyro4 name server") 
                Pyro4.naming.startNSloop()  # creates name server in own thread, so it doesnt have to be run manually in console     
            except  Exception as e:   
                print(e) 
                break
        
        
        
start_name_server = NameServer() # start the Pyro4 Name Server

if Option == 1:
    ExposedClass = Pyro4.expose(option1class) # Exposes our EnvClass, so it can be turned into a proxy class
elif Option == 2:
    ExposedClass = Pyro4.expose(option2class) 
else:
    raise Exception('Option not properly defined. Has to be 1 or 2')

while True:    
    try: 
        ns = Pyro4.locateNS()
        print("Found Pyro4 name server.")  # find the name server
        break
    except  Exception as e:   
        print(e)
                     
daemon = Pyro4.Daemon()     # make a Pyro daemon
uri = daemon.register(ExposedClass)    # register the exposed class rather than the library class itself
ns.register("GymEnvProxy.Env1", uri)   # register the object with a name in the name server
rospy.logwarn('starting ProxyEnv Node')

print('Proxy Gym Environment is Ready!')
daemon.requestLoop()    # start the event loop of the server to wait for calls