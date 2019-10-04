import rospy
import numpy
from math import pi, sqrt, atan2
from gym import spaces
import j2n6s300_env
from gym.envs.registration import register
from geometry_msgs.msg import Point
import time
import tf

# The path is __init__.py of openai_ros, where we import the MovingCubeOneDiskWalkEnv directly
timestep_limit_per_episode = 1000 # Can be any Value

register(
        id='j2n6s300Test-v0',
        entry_point='j2n6s300_test:j2n6s300TestEnv',
        #timestep_limit=timestep_limit_per_episode,
    )

class j2n6s300TestEnv(j2n6s300_env.j2n6s300Env):
    def __init__(self):
        
        
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
        
        self.timer_real = time.time()
        self.running_step = 0.05
        self.n_step = 0
        self.max_vel = 0.7 #rad/s
        self.n_episode = 0
        self.consecutive_errors = 0
        self.min_distance = 10
        self.target_point = [0.5, 0.5, 0.5]
        
        
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
        self.reset_mode = True
        self.collision_bool = True #set collision as true, so moving to init pose doesnt get collision checked. arm could get stuck otherwise
        self.move_joints(self.init_pose, 1, 2.5) 
        self.reset_mode = False
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
        self.min_distance = 10


    def _set_action(self, action):
        """
        Move the robot based on the action variable given
        """
        self.n_step += 1
        #print('step:',  self.n_step)
        #if not self.collision_bool:
        #    self.consecutive_errors = 0
        self.collision_bool = False
        self.action = action
        #rospy.logwarn("action: " + str(action))
        joints = self.get_joints()
        positions = joints.position
        action_pos = list(self.init_pose)
        
        for i in range(len(action)):
            action_pos[i] =   positions[i] + self.max_vel * action[i]

        # 1st: unpause simulation
        rospy.logdebug("Unpause SIM...")
        #self.gazebo.unpauseSim()
        #print(action_pos)
        #rospy.logwarn('starting next move '+str((time.time()-self.timer_real)*1000 ))
        self.move_joints(jointcmds=action_pos, duration=1, execute_duration=self.running_step) 
        rospy.logdebug("Wait for some time to execute movement, time="+str(self.running_step))

        rospy.logdebug("DONE Wait for some time to execute movement, time=" + str(self.running_step))

        # 3rd: pause simulation
        rospy.logdebug("Pause SIM...")
        #self.gazebo.pauseSim()

    def _get_obs(self):
        """
        Here we define what sensor data of our robots observations
        To know which Variables we have acces to, we need to read the
        MyRobotEnv API DOCS
        :return: observations
        """
        #print('get obs '+str((time.time()-self.timer_real)*1000 ))
        data = self.get_joints()
        links = self.link_states
        del links.pose[0]
        del links.twist[0]
        del links.pose[0]
        del links.twist[0]
        obs =  numpy.zeros(56)
        for  i in range(7):
            tran = links.pose[i].position
            rot = links.pose[i].orientation
            obs[i*8+0] = tran.x
            obs[i*8+1] = tran.y
            obs[i*8+2] = tran.z
            obs[i*8+3] = rot.x
            obs[i*8+4] = rot.y
            obs[i*8+5] = rot.z
            obs[i*8+6] = rot.w
            obs[i*8+7] = data.position[i]
            
        deltax = obs[5*8+0]-self.target_point[0]
        deltay = obs[5*8+1]-self.target_point[1]
        deltaz = obs[5*8+2]-self.target_point[2]
        distance = sqrt(deltax**2+deltay**2+deltaz**2)
        self.min_distance = min(distance, self.min_distance)    
        #print('return obs '+str((time.time()-self.timer_real)*1000 ))
        return(obs.tolist())  



    def _is_done(self, observations):
        """
        Decide if episode is done based on the observations
        """

        if self.consecutive_errors > 0:
            self.reward = -1000
            self.n_episode += 1
            done = True
        elif  self.n_step == 998:
            self.n_episode += 1
            done = True
        else:
            done = False
        return done

    def _compute_reward(self, observations, done):
        """
        Return the reward based on the observations given        
        """
        
        
        
        self.reward = 0
        if self.collision_bool:
            self.reward=-100        
        return self.reward
        
    # Internal TaskEnv Methods
    def get_variable(self, var_name):
        return(vars(self).get(var_name))
          
    def shutdown_hook(self):
        rospy.logwarn('Env shutdown')
        self.info = 'user abort'