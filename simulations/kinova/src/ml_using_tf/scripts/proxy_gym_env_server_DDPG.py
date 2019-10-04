#! /usr/bin/env python



import Pyro4
from Pyro4 import naming
import gym
import threading

#-----only thing you have to change is the class you import here ------------
from task_env_continous_actions import j2n6s300TestEnv as ProxyEnvClass



#-----------------------------------------------------------------------------
#---------------Init Area - run any code you want to initialize once here-----
#-----------------------------------------------------------------------------
import rospy
rospy.init_node('j2n6s300_Proxy_gym_env', anonymous=True, log_level=rospy.WARN)
rospy.logwarn('derp')



#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------


class NameServer(object):
    def __init__(self):        
        thread = threading.Thread(target=self.start_name_server)
        thread.start()


    def start_name_server(self):
        while True:
            try: 
                print("Creating new Pyro4 name server") 
                Pyro4.naming.startNSloop()  #creates name server in own thread, so it doesnt have to be run manually in console     
            except  Exception as e:   
                print(e) 
                break

#-----------------------------------------------------------------------------
#---------------------Convert our Class to ProxyClass-------------------------
#-----------------------------------------------------------------------------

ExposedClass = Pyro4.expose(ProxyEnvClass) #Exposes our EnvClass, so it can be turned into a proxy class

while True:    
    try: 
        ns = Pyro4.locateNS()
        print("Found Pyro4 name server")  #find the name server
        break
    except  Exception as e:   
        print(e)
        start_name_server = NameServer() 
                     
daemon = Pyro4.Daemon()     # make a Pyro daemon
uri = daemon.register(ExposedClass)    # register the exposed class rather than the library class itself
ns.register("GymEnvProxy.Env1", uri)   # register the object with a name in the name server

print("Proxy Environment ready!")
daemon.requestLoop()    # start the event loop of the server to wait for calls
