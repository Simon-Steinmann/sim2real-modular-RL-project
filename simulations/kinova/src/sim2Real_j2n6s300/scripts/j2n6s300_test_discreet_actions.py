import rospy
import numpy
from math import pi, sqrt, atan2
from gym import spaces
import j2n6s300_env
from gym.envs.registration import register
from geometry_msgs.msg import Point
from time import sleep
import tf

# The path is __init__.py of openai_ros, where we import the MovingCubeOneDiskWalkEnv directly
timestep_limit_per_episode = 1000 # Can be any Value

register(
        id='j2n6s300Test-v1',
        entry_point='j2n6s300_test_discreet_actions:j2n6s300TestEnv',
        #timestep_limit=timestep_limit_per_episode,
    )

class j2n6s300TestEnv(j2n6s300_env.j2n6s300Env):
    def __init__(self):
        
        # Only variable needed to be set here
        number_actions = rospy.get_param('/j2n6s300/n_actions')
        self.action_space = spaces.Discrete(6)
        
        # This is the most common case of Box observation type
        high = numpy.full((24),numpy.inf)
            
        self.observation_space = spaces.Box(-high, high)
        
        # Variables that we retrieve through the param server, loded when launch training launch.
        self.timer = rospy.Time.now()
        self.listener = tf.TransformListener()
        self.collision_bool = True
        self.action = 0
        self.max_lin_acc = 0.05
        #self.init_joint_values = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 1, 1, 1]
        self.init_pose = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 1, 1, 1]
        self.jointcmds_history = []
        self.delta_angle = pi
        self.joint_pos_increment_value = 0.2
        self.max_roll_angle = pi*0.4
        self.max_pitch_angle = pi*0.4
        self.max_joint_position = pi/2
        self.max_joint_velocity = 10
        self.running_step = 0.35
        self.n_step = 0
        self.n_episode = 0
        self.consecutive_errors = 0
        self.joint_names = ['j2n6s300_joint_1', 'j2n6s300_joint_2', 'j2n6s300_joint_3', 'j2n6s300_joint_4', 'j2n6s300_joint_5', 'j2n6s300_joint_6', 'j2n6s300_finger_1', 'j2n6s300_finger_2', 'j2n6s300_finger_3']
        self.listener = tf.TransformListener(True, rospy.Duration(10.0))
        self.frame_list = ['root',
            'j2n6s300_link_1', 'j2n6s300_link_2','j2n6s300_link_3', 'j2n6s300_link_4','j2n6s300_link_5', 'j2n6s300_link_6', #1-6
            'j2n6s300_link_finger_1', 'j2n6s300_link_finger_2', 'j2n6s300_link_finger_3',  #7-9
            'j2n6s300_link_finger_tip_1', 'j2n6s300_link_finger_tip_2', 'j2n6s300_link_finger_tip_3'] #10-12
        # Here we will add any init functions prior to starting the MyRobotEnv
        super(j2n6s300TestEnv, self).__init__()
        print('Environment ready')


    def _set_init_pose(self):
        """Sets the Robot in its init pose  
        """
        self.collision_bool = True #set collision as true, so moving to init pose doesnt get collision checked. arm could get stuck otherwise
        self.move_joints(self.init_pose, 2) 
        return True

    def _init_env_variables(self):
        """
        Inits variables needed to be initialised each time we reset at the start
        of an episode.
        :return:
        """
        self.reward = 0
        self.n_step = 0
        self.consecutive_errors = 0


    def _set_action(self, action):
        """
        Move the robot based on the action variable given
        """
        if not self.collision_bool:
            self.consecutive_errors = 0
        self.collision_bool = False
        self.action = action
        rospy.logwarn("action: " + str(action))
        joints = self.get_joints()

        positions = joints.position
        action_pos = list(self.init_pose)
        
        for i in xrange(3):
            action_pos[i] = positions[i]
            if action == 0:
                action_pos[i] = positions[i] - self.joint_pos_increment_value
            elif action == 1:
                action_pos[i] = positions[i] + self.joint_pos_increment_value
            action -= 2

        # 1st: unpause simulation
        rospy.logdebug("Unpause SIM...")
        self.gazebo.unpauseSim()

        self.move_joints(action_pos,self.running_step)
        rospy.logdebug("Wait for some time to execute movement, time="+str(self.running_step))

        rospy.logdebug("DONE Wait for some time to execute movement, time=" + str(self.running_step))

        # 3rd: pause simulation
        rospy.logdebug("Pause SIM...")
        self.gazebo.pauseSim()

    def _get_obs(self):
        """
        Here we define what sensor data of our robots observations
        To know which Variables we have acces to, we need to read the
        MyRobotEnv API DOCS
        :return: observations
        """
        data = self.get_joints()
        links = self.link_states
        del links.pose[0]
        x_diff = abs(0.5-self.link_states.pose[6].position.x)
        y_diff = abs(0.5-self.link_states.pose[6].position.y)
        z_diff = abs(0.5-self.link_states.pose[6].position.z)
        dist2target = sqrt(x_diff**2 + y_diff**2 + z_diff**2)
        
        
        
        obs = [
            dist2target,
            self.delta_angle,
            links.pose[5].position.x,
            links.pose[5].position.y,
            links.pose[5].position.z,
            round(data.position[0],1),
            round(data.position[1],1),
            round(data.position[2],1),
            round(data.position[3],1),
            round(data.position[4],1),
            round(data.position[5],1),            
            ]
         
        for pose in  links.pose:
            #obs.append(pose.position.x)
            #obs.append(pose.position.y)
            obs.append(pose.position.z)
        
        return obs

    def _is_done(self, observations):
        """
        Decide if episode is done based on the observations
        """
        if self.reward > 200:
            self.n_episode += 1
            done = True
        elif self.consecutive_errors > 3:
            self.reward = -1000
            self.n_episode += 1
            done = True
        elif  self.n_step == 998:
            self.reward = -500
            self.n_episode += 1
            done = True
        else:
            done = False
        return done

    def _compute_reward(self, observations, done):
        """
        Return the reward based on the observations given        
        """
        
        x_diff = abs(0.5-self.link_states.pose[6].position.x)
        y_diff = abs(0.5-self.link_states.pose[6].position.y)
        z_diff = abs(0.5-self.link_states.pose[6].position.z)
        distance = sqrt(x_diff**2 + y_diff**2 + z_diff**2)
        self.reward = min(200 , 15/(distance**2))
        #give incentive for joint_3 to be high above the ground instead of low
        self.reward -= 5*(0.5- self.link_states.pose[3].position.z)
        if self.link_states.pose[3].position.z < 0.5:
            self.reward  -= 1/self.link_states.pose[3].position.z
        
        #give incentive to turn the robot towards the target
        rot = self.link_states.pose[6].orientation
        (roll, pitch, yaw) = tf.transformations.euler_from_quaternion([rot.x, rot.y, rot.z, rot.w])
        rot = self.link_states.pose[6].orientation
        (roll, pitch, yaw) = tf.transformations.euler_from_quaternion([rot.x, rot.y, rot.z, rot.w])
        target_angle = atan2(0.5,0.5)
        self.delta_angle = target_angle-yaw
        if self.delta_angle > pi:
            self.delta_angle -= 2*pi
        elif self.delta_angle < -pi:
            self.delta_angle += 2*pi
        self.reward += 10*(pi/6 - abs(self.delta_angle))     
        
        
        
        if self.collision_bool:
            self.reward = -100
        rospy.logwarn("Ep: " +str(self.n_episode) +" Step: " +str(self.n_step) + " Reward: " + str(self.reward))
        self.n_step += 1
        return self.reward
        
    # Internal TaskEnv Methods
