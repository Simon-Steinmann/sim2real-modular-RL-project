#! /usr/bin/env python
#! /usr/bin/env python
"""Publishes joint trajectory to move robot to given pose"""

import rospy
from trajectory_msgs.msg import JointTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint
from gazebo_msgs.srv import SetModelConfiguration, SetModelConfigurationRequest, DeleteModel, DeleteModelRequest, SpawnModel, SpawnModelRequest
from std_srvs.srv import Empty
import time
from controllers_connection import  ControllersConnection


                                                


rospy.init_node('j2n6s300_custom_reset')		

controllers_list=['joint_1_position_controller',
                                                'joint_2_position_controller',
                                                'joint_3_position_controller',
                                                'joint_4_position_controller',
                                                'joint_5_position_controller',
                                                'joint_6_position_controller',
                                                'finger_1_position_controller',
                                                'finger_2_position_controller',
                                                'finger_3_position_controller',
                                                'joint_state_controller']

joint_names = ['j2n6s300_joint_1', 'j2n6s300_joint_2', 'j2n6s300_joint_3', 'j2n6s300_joint_4', 'j2n6s300_joint_5', 'j2n6s300_joint_6', 'j2n6s300_finger_1', 'j2n6s300_finger_2', 'j2n6s300_finger_3']
joint_positions =  [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 1 ,1, 1]
model_config = SetModelConfigurationRequest()
model_config.model_name = 'j2n6s300'
model_config.urdf_param_name = '/robot_description'
model_config.joint_names = joint_names
model_config.joint_positions =  joint_positions


controllers_object = ControllersConnection(namespace='j2n6s300', controllers_list=controllers_list)
pub = rospy.Publisher('/j2n6s300/effort_joint_trajectory_controller/command', JointTrajectory, queue_size=1)
pubf = rospy.Publisher('/j2n6s300/effort_joint_trajectory_controller/command', JointTrajectory, queue_size=1)
unpause_gazebo = rospy.ServiceProxy('/gazebo/unpause_physics', Empty)
pause_gazebo = rospy.ServiceProxy('/gazebo/pause_physics', Empty)
reset_sim = rospy.ServiceProxy('/gazebo/reset_simulation', Empty)
set_model_srv = rospy.ServiceProxy('/gazebo/set_model_configuration', SetModelConfiguration)



jointCmd = JointTrajectory()  
point = JointTrajectoryPoint()
jointCmd.header.stamp = rospy.Time.now() + rospy.Duration.from_sec(0.0);  
point.time_from_start = rospy.Duration.from_sec(1)
for i in range(0, 6):
    jointCmd.joint_names.append('j2n6s300_joint_'+str(i+1))
    point.positions.append(joint_positions[i])
    point.velocities.append(0)
    point.accelerations.append(0)
    point.effort.append(0) 
jointCmd.points.append(point)
rate = rospy.Rate(100)
count = 0

topic_name = '/j2n6s300/effort_finger_trajectory_controller/command'
pubf = rospy.Publisher(topic_name, JointTrajectory, queue_size=1)  
jointCmd_finger = JointTrajectory()  
point = JointTrajectoryPoint()
jointCmd_finger.header.stamp = rospy.Time.now() + rospy.Duration.from_sec(0.0);  
point.time_from_start = rospy.Duration.from_sec(1)
for i in range(0, 3):
    jointCmd_finger.joint_names.append('j2n6s300_joint_finger_'+str(i+1))
    point.positions.append(joint_positions[i+6])
    point.velocities.append(0)
    point.accelerations.append(0)
    point.effort.append(0) 
jointCmd_finger.points.append(point)
rate = rospy.Rate(100)
count = 0

while (count < 50):
    pub.publish(jointCmd)
    pubf.publish(jointCmd_finger)
    count = count + 1
    rate.sleep()     
time.sleep(1)  

time.sleep(.1)


rospy.wait_for_service('/gazebo/pause_physics')
pause_gazebo()
rospy.wait_for_service('/gazebo/reset_simulation')
reset_sim()
rospy.wait_for_service('/gazebo/set_model_configuration')
print(model_config)
set_model_srv(model_config)
pub.publish(jointCmd)
pubf.publish(jointCmd_finger)
time.sleep(0.2)
rospy.wait_for_service('/gazebo/unpause_physics')
unpause_gazebo()
controllers_object.reset_controllers()





    
    
    
    
