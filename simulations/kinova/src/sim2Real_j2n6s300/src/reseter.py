#!/usr/bin/env python
import rospy
import gym
#from gazebo_connection import GazeboConnection
from openai_ros.robot_gazebo_env import RobotGazeboEnv
#from jaco2_actions import jaco2_actions
#import os


#longstr='joint_1_position_controller'+' joint_2_position_controller'+' joint_3_position_controller'+' joint_4_position_controller'+ 'joint_5_position_controller'+' joint_6_position_controller'+' finger_1_position_controller'+' finger_2_position_controller'+' finger_3_position_controller'+' joint_state_controller'

#reset_world_or_sim="SIMULATION"
#start_init_physics_parameters=False


         					
reset_controls=True
robot_name_space="j2n6s300"
controllers_list=['joint_1_position_controller','joint_2_position_controller','joint_3_position_controller','joint_4_position_controller','joint_5_position_controller','joint_6_position_controller','finger_1_position_controller','finger_2_position_controller','finger_3_position_controller','joint_state_controller']
rm=RobotGazeboEnv(robot_name_space, controllers_list, reset_controls, start_init_physics_parameters=True, reset_world_or_sim="SIMULATION")

#os.system("rosrun controller_manager controller_manager kill 'joint_1_position_controller'+' joint_2_position_controller'+' joint_3_position_controller'+' joint_4_position_controller'+ 'joint_5_position_controller'+' joint_6_position_controller'+' finger_1_position_controller'+' finger_2_position_controller'+' finger_3_position_controller'+' joint_state_controller'")

rm.reset()

#joint_angles = [0.0,2.9,1.3,4.2,1.4,0.0,0.0,0.0,0.0] #home position
#jaco2_actions(joint_angles)
#rm.gazebo.unpause()
#joint_angles = [0.0,2.9,1.3,4.2,1.4,0.0,0.0,0.0,0.0]
#rostopic pub -1 /j2n6s300/joint_1_position_controller/command std_msgs/Float64 0.0
#rostopic pub -1 /j2n6s300/joint_1_position_controller/command std_msgs/Float64 0.0
#rostopic pub -1 /j2n6s300/joint_2_position_controller/command std_msgs/Float64 joint_angles[1]
#rostopic pub -1 /j2n6s300/joint_3_position_controller/command std_msgs/Float64 joint_angles[2]
#rostopic pub -1 /j2n6s300/joint_4_position_controller/command std_msgs/Float64 joint_angles[3]
#rostopic pub -1 /j2n6s300/joint_5_position_controller/command std_msgs/Float64 joint_angles[4]
#rostopic pub -1 /j2n6s300/joint_6_position_controller/command std_msgs/Float64 joint_angles[5]
#rostopic pub -1 /j2n6s300/finger_1_position_controller/command std_msgs/Float64 joint_angles[6]
#rostopic pub -1 /j2n6s300/finger_2_position_controller/command std_msgs/Float64 joint_angles[7]
#rostopic pub -1 /j2n6s300/finger_3_position_controller/command std_msgs/Float64 joint_angles[8]

#os.system("rosrun controller_manager controller_manager load longstr")

#rm.gazebo.unpauseSim()

