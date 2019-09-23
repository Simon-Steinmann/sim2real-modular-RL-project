import rospy
import numpy as np
from math import pi, sqrt, atan2
import gym
from gym import spaces
from gym.envs.registration import register
from gym.utils import seeding
from geometry_msgs.msg import Point, Pose, Twist
from time import sleep
import tf
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Pose, Twist
from gazebo_msgs.msg import LinkStates
import time
from tf2_msgs.msg import TFMessage
from ros_numpy import numpify, msgify
from urdf_parser import UrdfParser

timestep_limit_per_episode = 1000 # Can be any Value

register(
        id='j2n6s300Test-v2',
        entry_point='task_env_tensorflow:j2n6s300TestEnv',
        #timestep_limit=timestep_limit_per_episode,
    )

class j2n6s300TestEnv(gym.Env):
    def __init__(self):
        
        # Only variable needed to be set here
        self.action_space = spaces.Discrete(6)
        
        # This is the most common case of Box observation type
        high = np.full((18),np.inf)
            
        self.observation_space = spaces.Box(-high, high)
        
        # Variables that we retrieve through the param server, loded when launch training launch.
        self.action = 0
        self.init_positions = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 1, 1, 1, 0.0, 0.0, 0.0] 
        self.joint_angles = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 1, 1, 1, 0.0, 0.0, 0.0] 
        
        self.target_point = [0.5,0.5,0.5]
        self.joint_pos_increment_value = 0.1
        self.n_step = 0
        self.n_episode = 0 
        self.joint_names =  ['j2n6s300_joint_1', 'j2n6s300_joint_2', 'j2n6s300_joint_3', 'j2n6s300_joint_4', 'j2n6s300_joint_5',
              'j2n6s300_joint_6', 'j2n6s300_joint_finger_1', 'j2n6s300_joint_finger_2', 'j2n6s300_joint_finger_3',
              'j2n6s300_joint_finger_tip_1', 'j2n6s300_joint_finger_tip_2', 'j2n6s300_joint_finger_tip_3']    
        self.frame_list = ['root',
            'j2n6s300_link_1', 'j2n6s300_link_2','j2n6s300_link_3', 'j2n6s300_link_4','j2n6s300_link_5', 'j2n6s300_link_6', #1-6
            'j2n6s300_link_finger_1', 'j2n6s300_link_finger_2', 'j2n6s300_link_finger_3',  #7-9
            'j2n6s300_link_finger_tip_1', 'j2n6s300_link_finger_tip_2', 'j2n6s300_link_finger_tip_3','j2n6s300_end_effector'] #10-12

        self.counter = 0
        self.timer = time.time()
        self.pub = rospy.Publisher("joint_states", JointState, queue_size=10)       
        self.joint_state = JointState()
        self.joint_state.name = self.joint_names        
        self.link_states = LinkStates()        
        
        
        parser = UrdfParser()
        self.urdf_tranform_matricies = parser.get_urdf_trans_mats()
        self.urdf_transforms = parser.get_urdf_trans()
        self.calculate_joints(self.init_positions)
        self.reset()
        
    # Env methods
    def seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]

    def step(self, action):
        self.counter += 1
        if time.time() > self.timer + 0.2:
            print"Steps per second: " + str(self.counter * 1/0.2)
            self.timer = time.time()
            self.counter = 0
    
        joints = self.joint_state

        positions = joints.position
        action_pos = list(self.init_positions)
        print(action)
        for i in xrange(3):
            action_pos[i] = positions[i]
            if action == 0:
                action_pos[i] = positions[i] - self.joint_pos_increment_value
            elif action == 1:
                action_pos[i] = positions[i] + self.joint_pos_increment_value
            action -= 2
        self.joint_state_pub(action_pos)
        self.joint_angles = action_pos
        self.calculate_joints(action_pos)
        
        self.n_step += 1
        
        reward = 0
        obs = self.get_obs()     
        #print obs
        info = "derp"        
        #reward = self.get_reward(obs)
        #print reward
        rospy.sleep(0.5)
        if self.n_step > 998 or reward > 200:
            done = True
            self.n_episode += 1
        else:            
            done = False
        return obs, reward, done, info

    def reset(self):
        self.joint_state_pub(self.init_positions)
        print(self.n_step)
        sleep(1)
        self.n_step = 0
        obs = self.get_obs()
        return obs

    def close(self):
        """
        Function executed when closing the environment.
        Use it for closing GUIS and other systems that need closing.
        :return:
        """
        rospy.logdebug("Closing RobotGazeboEnvironment")
        rospy.signal_shutdown("Closing RobotGazeboEnvironment")
        
    def joint_state_pub(self,positions ):  
        #update joint_state
        self.joint_state.header.seq = self.n_episode * 1000 + self.n_step
        self.joint_state.header.stamp = rospy.Time.now()
        self.joint_state.position = positions
        #self.pub.publish(self.joint_state) 
        while not rospy.is_shutdown():
            connections = self.pub.get_num_connections()
            if connections > 0:
                self.pub.publish(self.joint_state)
                break
            
     

        
    def get_obs(self):

    
        obs_full =  np.zeros(84)   
        ls = self.link_states
        #print self.link_states
        for i in xrange(len(self.link_states.name)):
            obs_full[i*7+0] = round(ls.pose[i].position.x,3)
            obs_full[i*7+1] = round(ls.pose[i].position.y,3)
            obs_full[i*7+2] = round(ls.pose[i].position.z,3)
            obs_full[i*7+3] = round(ls.pose[i].orientation.x,3)
            obs_full[i*7+4] = round(ls.pose[i].orientation.y,3)
            obs_full[i*7+5] = round(ls.pose[i].orientation.z,3)
            obs_full[i*7+6] = round(ls.pose[i].orientation.w,3)
            
        obs =  np.zeros(18) 
        for i in xrange(6):
            obs[i*3+0] = obs_full[i*7+0]
            obs[i*3+1]= obs_full[i*7+1]
            obs[i*3+2] = obs_full[i*7+2]
        
        data = self.joint_angles
        links = self.link_states
        x_diff = abs(0.5-self.link_states.pose[5].position.x)
        y_diff = abs(0.5-self.link_states.pose[5].position.y)
        z_diff = abs(0.5-self.link_states.pose[5].position.z)
        dist2target = sqrt(x_diff**2 + y_diff**2 + z_diff**2)
        
        
        obs = [
            dist2target,
            links.pose[5].position.x,
            links.pose[5].position.y,
            links.pose[5].position.z,
            round(data[0],1),
            round(data[1],1),
            round(data[2],1),
            round(data[3],1),
            round(data[4],1),
            round(data[5],1),            
            ]
        return obs
        
        
        
    def get_reward(self, obs):
        deltax = obs[1]-self.target_point[0]
        deltay = obs[2]-self.target_point[1]
        deltaz = obs[3]-self.target_point[2]
        distance = sqrt(deltax**2+deltay**2+deltaz**2)
        
        if distance < 0.3:
            reward = 1
        else:
            reward = 0
        reward = min(500,1/(distance**4))
        return reward
        
    def calculate_joints(self, position):
        
        self.joint_angle_matricies = []
        for angle in position:
            self.joint_angle_matricies.append(tf.transformations.euler_matrix(0, 0, angle))
        T_c = [np.identity(4)]
        link_states = LinkStates()        
        for index in xrange(len(self.urdf_tranform_matricies)):
            urdf_transform_matrix = self.urdf_tranform_matricies[index]
            joint_angle_matrix = self.joint_angle_matricies[index]
            transform_matrix = np.dot(urdf_transform_matrix, joint_angle_matrix)
            if index in (6, 7, 8): #sets parent of fingers to link6
                index = 6
            elif index in (9, 10, 11):#sets parent of fingertip
                index -= 2
            T_c.append(np.dot(T_c[index], transform_matrix))
            link_states.pose.append(msgify(Pose, T_c[-1]))
            link_states.name.append(self.urdf_transforms[index].child_frame_id)
            #print transforms.header
            #print link_states.name[-1]
            #print link_states.pose[-1]
            #print '-----------------------------------------------'
        self.link_states = link_states
        #print link_states