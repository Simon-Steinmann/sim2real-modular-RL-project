import rospy
import numpy
from math import sqrt
import gym
from gym import spaces
from gym.envs.registration import register
from gym.utils import seeding
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Point, PointStamped 
from joint_pos_2_tf import Pos2Tf  
from kinematics import Jaco2Kinematics
import random
import pickle


    # Register Env-----------------------------------------------------------------------------------------------


exists = False
for env in gym.envs.registry.all():
    if env.id == 'j2n6s300Test-v3': 
        exists = True
print(exists)        
if not exists:
    register(
                id='j2n6s300Test-v3',
                entry_point='task_env_tf:j2n6s300TestEnv' )


class j2n6s300TestEnv(gym.Env):
    def __init__(self):
        
        # Variable for the training script--------------------------------------------------------------------
        self.action_space = spaces.Discrete(12)
        high = numpy.full((56),2)            
        self.observation_space = spaces.Box(-high, high)
        # Variables for the Env--------------------------------------------------------------------------------
        self.kinematics = Jaco2Kinematics()
        self.inner_radius = 0.2
        self.outer_radius = 0.7
        self.point1_pub = rospy.Publisher('goal_position_marker_rviz', PointStamped, queue_size=5)
        self.goal_point = PointStamped()
        self.goal_point.header.frame_id = "world"
        self.point2_pub = rospy.Publisher('init_position_marker_rviz', PointStamped, queue_size=5)
        self.init_point = PointStamped()
        self.init_point.header.frame_id = "world"
        
        
        
        self.action = 0
        self.init_positions = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 0, 0, 0, 0, 0, 0.0] 
        self.target_point = [0.5,0.5,0.5]
        self.joint_pos_increment_value = 0.15
        self.n_step = 0
        self.n_episode = 0 
        self.info = 'running'
        self.min_distance = 10
        self.obs_buffer = []
        
        self.joint_names =  ['j2n6s300_joint_1', 'j2n6s300_joint_2', 'j2n6s300_joint_3', 'j2n6s300_joint_4', 'j2n6s300_joint_5',
              'j2n6s300_joint_6', 'j2n6s300_joint_finger_1', 'j2n6s300_joint_finger_tip_1', 'j2n6s300_joint_finger_2',
              'j2n6s300_joint_finger_tip_2', 'j2n6s300_joint_finger_3', 'j2n6s300_joint_finger_tip_3']    
        self.pub = rospy.Publisher("joint_states", JointState, queue_size=1)
        self.joint_state = JointState()
        self.joint_state.name = self.joint_names
        rospy.on_shutdown(self.shutdown_hook)   
        self.Pos2Tf = Pos2Tf()
        self.reset()
        rospy.logwarn('Environment ready!')
        
#------------------------------------------------------------------------------------------------------------------
#----------------Gym Env Methods------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------

    def seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]
        

    def step(self, action):
        #print(action)
        joints = self.joint_state
        positions = joints.position
        action_pos = list(self.init_positions)        
        for i in range(6):
            action_pos[i] = positions[i]
            if action == 0:
                action_pos[i] = positions[i] - self.joint_pos_increment_value
            elif action == 1:
                action_pos[i] = positions[i] + self.joint_pos_increment_value
            action -= 2
            
        obs = self.get_obs(action_pos)     
        for i in range(7):
            if obs[i*8+2] < 0.08:
                action_pos = list(self.init_positions)  
                obs = self.get_obs(action_pos)

            
            
        self.joint_state_pub(action_pos)
        
        self.n_step += 1  
        
        info = self.info        
        reward = self.get_reward(obs)
        #reward = 0
        done = self.is_done()           
        return obs, reward, done, info
        

    def reset(self):  
        rand_point = self.kinematics.RandomPointInSphere(inner_radius=0, outer_radius=0.2, center_point=[0.3, 0, 0.8])
        self.init_point.point = Point(rand_point[0],rand_point[1],rand_point[2])
        init_pos = self.kinematics.Target2JointPos(rand_point)
        self.joint_state_pub(init_pos)
        
        self.target_point = self.kinematics.RandomPointInSphere(self.inner_radius, self.outer_radius)
        
        self.target_point[2] = max(0.1,self.target_point[2]) #make z value positive
        self.target_point[0] = -abs(self.target_point[0]) #make x value negative, so it's not too close to init pos
        #self.target_point = [0.5, 0.5, 0.5]
        
        self.goal_point.point = Point(self.target_point[0],self.target_point[1],self.target_point[2])
        self.point1_pub.publish(self.goal_point)
        self.point2_pub.publish(self.init_point)
         
        
        
        print(self.n_episode, self.n_step, self.min_distance)
        self.n_step = 0
        self.n_episode += 1
        self.min_distance = 10
        obs = self.get_obs(init_pos)
        return obs


    def close(self):
        """
        Function executed when closing the environment.
        Use it for closing GUIS and other systems that need closing.
        :return:
        """
        rospy.signal_shutdown("Closing RobotGazeboEnvironment")
        

#------------------------------------------------------------------------------------------------------------------
#----------------Support functions needed for the mein gym functions------------------------
#------------------------------------------------------------------------------------------------------------------
     
    def get_obs(self, positions):
        obs =  numpy.zeros(56)
        tf_msg = self.Pos2Tf.calculate_joints(positions, 6)
        for  i in range(7):
            tran = tf_msg[i].transform.translation
            rot = tf_msg[i].transform.rotation
            obs[i*8+0] = tran.x
            obs[i*8+1] = tran.y
            obs[i*8+2] = tran.z
            obs[i*8+3] = rot.x
            obs[i*8+4] = rot.y
            obs[i*8+5] = rot.z
            obs[i*8+6] = rot.w
            obs[i*8+7] = positions[i]
       

            
        #self.obs_buffer.append(obs)    
        

        #print(features)
        return(obs.tolist())   
        
        
    def get_reward(self, obs):
        deltax = obs[5*8+0]-self.target_point[0]
        deltay = obs[5*8+1]-self.target_point[1]
        deltaz = obs[5*8+2]-self.target_point[2]
        distance = sqrt(deltax**2+deltay**2+deltaz**2)
        self.min_distance = min(distance, self.min_distance)
        if distance < 0.1:
            reward = 1
        else:
            reward = 0
        #reward = min(500,1/(distance**2))
        self.reward = reward
        return reward
        
    def is_done(self):
        if self.n_step == 360 or self.reward  == 1: #
            
            return True
            
        else:            
            return False
            


    
    def joint_state_pub(self,positions ):  
        #update joint_state
        self.joint_state.header.stamp = rospy.Time.now()
        self.joint_state.position = positions
                
        """
        This is because publishing in topics sometimes fails the first time you publish.
        In continuous publishing systems, this is no big deal, but in systems that publish only
        once, it IS very important.
        """ 
        while not rospy.is_shutdown():
            connections = self.pub.get_num_connections()
            if connections > 0:
                self.pub.publish(self.joint_state)
                break
                   
    def get_variable(self, var_name):
        return(vars(self).get(var_name))
          
    def shutdown_hook(self):
        rospy.logwarn('Env shutdown')
        self.info = 'user abort'