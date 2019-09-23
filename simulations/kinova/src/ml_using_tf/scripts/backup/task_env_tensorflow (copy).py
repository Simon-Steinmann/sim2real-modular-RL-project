import rospy
import numpy
from math import pi, sqrt, atan2
import gym
from gym import spaces
from gym.envs.registration import register
from geometry_msgs.msg import Point, Pose, Twist
from time import sleep
import tf
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Pose, Twist
from gazebo_msgs.msg import LinkStates
from joint_pos_2_tf import Pos2Tf  

timestep_limit_per_episode = 1000 # Can be any Value

register(
        id='j2n6s300Test-v1',
        entry_point='task_env_tensorflow:j2n6s300TestEnv',
        #timestep_limit=timestep_limit_per_episode,
    )

class j2n6s300TestEnv(gym.Env):
    def __init__(self):
        
        # Only variable needed to be set here
        self.action_space = spaces.Discrete(12)
        
        # This is the most common case of Box observation type
        high = numpy.full((45),numpy.inf)
            
        self.observation_space = spaces.Box(-high, high)
        
        # Variables that we retrieve through the param server, loded when launch training launch.
        self.action = 0
        self.init_positions = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 0, 0, 0, 0, 0, 0.0] 
        self.target_point = [0.5,0.5,0.5]
        self.joint_pos_increment_value = 0.1
        self.n_step = 0
        self.n_episode = 0 
        self.joint_names =  ['j2n6s300_joint_1', 'j2n6s300_joint_2', 'j2n6s300_joint_3', 'j2n6s300_joint_4', 'j2n6s300_joint_5',
              'j2n6s300_joint_6', 'j2n6s300_joint_finger_1', 'j2n6s300_joint_finger_tip_1', 'j2n6s300_joint_finger_2',
              'j2n6s300_joint_finger_tip_2', 'j2n6s300_joint_finger_3', 'j2n6s300_joint_finger_tip_3']    
        self.listener = tf.TransformListener(True, rospy.Duration(10.0))
        self.frame_list = [
            'j2n6s300_link_1', 'j2n6s300_link_2','j2n6s300_link_3', 'j2n6s300_link_4','j2n6s300_link_5', 'j2n6s300_link_6', #1-6
            'j2n6s300_link_finger_1', 'j2n6s300_link_finger_2', 'j2n6s300_link_finger_3',  #7-9
            'j2n6s300_link_finger_tip_1', 'j2n6s300_link_finger_tip_2', 'j2n6s300_link_finger_tip_3','j2n6s300_end_effector'] #10-12


        self.pub = rospy.Publisher("joint_states", JointState, queue_size=1)
        self.joint_state = JointState()
        self.joint_state.name = self.joint_names
        self.listener = tf.TransformListener(False, rospy.Duration(10))
        self.timestamp = rospy.Time.now()
        names = self.listener.getFrameStrings()
        while not rospy.is_shutdown() and len(names)<15:
           self.joint_state_pub(self.init_positions)
           names = self.listener.getFrameStrings()
           
        self.Pos2Tf = Pos2Tf()
        self.reset()
        
    # Env methods
    def seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]

    def step(self, action):
        #print action
        joints = self.joint_state

        positions = joints.position
        action_pos = list(self.init_positions)
        
        for i in xrange(6):
            action_pos[i] = positions[i]
            if action == 0:
                action_pos[i] = positions[i] - self.joint_pos_increment_value
            elif action == 1:
                action_pos[i] = positions[i] + self.joint_pos_increment_value
            action -= 2
            
        #action_pos = list(self.init_positions)    
        #self.joint_state_pub(action_pos)
        
        
        
        
        self.n_step += 1
        #rospy.sleep(.1)
        #obs = self.get_obs()        
        obs = self.get_obs2(action_pos)
        info = "derp"        
        reward = self.get_reward(obs)
        #reward = 0
        #print reward
        #print obs
        #print obs2
        '''for i in xrange(12):
            print self.joint_names[i] +' index: ' + str(i) +' pos: '  + str(action_pos[i])
            print obs[i*3+0],obs[i*3+1],obs[i*3+2]
            print obs2[i*3+0],obs2[i*3+1],obs2[i*3+2]'''
        #print '---------------------------------------------------------------------'
        if self.n_step > 999 or reward > 200:
            done = True
        else:            
            done = False
        return obs, reward, done, info

    def reset(self):
        self.joint_state_pub(self.init_positions)
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
        self.joint_state.header.stamp = rospy.Time.now()
        self.joint_state.position = positions
        self.pub.publish(self.joint_state)
        
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
            
     
    def timestamp_check(self):
        new_timestamp = self.listener.getLatestCommonTime('root', 'j2n6s300_end_effector')          
        if new_timestamp == self.timestamp:            
            self. joint_state_pub(self.joint_state.position)
            return True
        else:
            self.timestamp =  new_timestamp
            print(new_timestamp == self.timestamp)    
            return False
            
    def repub_joint_state(self):        
        self.pub.publish(self.joint_state)
        self.get_obs()
        
    def get_obs(self):
        obs =  numpy.zeros(45)
        
        #following loop makes sure that the tf messages have been updated
        #new_timestamp = self.listener.getLatestCommonTime('root', 'j2n6s300_end_effector') 
        #print(new_timestamp == self.timestamp)   
        #if new_timestamp == self.timestamp:
        #    self.repub_joint_state()        
        #self.timestamp =  new_timestamp
        #print(self.n_step)
        
        for  name in self.frame_list:
            i = self.frame_list.index(name)
            (tran,rot) = self.listener.lookupTransform('root', name,   rospy.Time())         
            obs[i*3+0] = round(tran[0],3)
            obs[i*3+1] = round(tran[1],3)
            obs[i*3+2] = round(tran[2],3)
            if i == 11:
                break
        return(obs)
        
        
    def get_obs2(self, positions):
        obs =  numpy.zeros(45)
        tf_msg = self.Pos2Tf.calculate_joints(positions)
        for  transforms in tf_msg.transforms:
            i = tf_msg.transforms.index(transforms)
            tran = transforms.transform.translation
            obs[i*3+0] = round(tran.x,3)
            obs[i*3+1] = round(tran.y,3)
            obs[i*3+2] = round(tran.z,3)
            if i == 11:
                break
        return(obs)   
        
        
    def get_reward(self, obs):
        deltax = obs[13*3+0]-self.target_point[0]
        deltay = obs[13*3+1]-self.target_point[1]
        deltaz = obs[13*3+2]-self.target_point[2]
        distance = sqrt(deltax**2+deltay**2+deltaz**2)
        
        if distance < 0.3:
            reward = 1
        else:
            reward = 0
        reward = min(500,1/(distance**2))
        return reward