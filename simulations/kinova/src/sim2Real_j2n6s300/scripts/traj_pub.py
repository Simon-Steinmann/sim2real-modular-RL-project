#! /usr/bin/env python
"""Publishes joint trajectory to move robot to given pose"""

import rospy
from trajectory_msgs.msg import JointTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint
from std_srvs.srv import Empty
import argparse
import time
from math import pi

def argumentParser(argument):
  """ Argument parser """
  parser = argparse.ArgumentParser(description='Drive robot joint to command position')
  parser.add_argument('kinova_robotType', metavar='kinova_robotType', type=str, default='j2n6a300',
                    help='kinova_RobotType is in format of: [{j|m|r|c}{1|2}{s|n}{4|6|7}{s|a}{2|3}{0}{0}]. eg: j2n6a300 refers to jaco v2 6DOF assistive 3fingers. Please be noted that not all options are valided for different robot types.')
  #args_ = parser.parse_args(argument)
  argv = rospy.myargv()
  args_ = parser.parse_args(argv[1:])
  prefix = args_.kinova_robotType
  nbJoints = int(args_.kinova_robotType[3])	
  nbfingers = int(args_.kinova_robotType[5])	
  return prefix, nbJoints, nbfingers

def moveJoint (jointcmds):
  topic_name =  '/j2n6s300_driver/trajectory_controller/command'
  #topic_name =  '/j2n6s300/effort_joint_trajectory_controller/command'
  print"DERP"
  pub = rospy.Publisher(topic_name, JointTrajectory, queue_size=1)
  jointCmd = JointTrajectory()  
  point = JointTrajectoryPoint()
  jointCmd.header.stamp = rospy.Time.now() + rospy.Duration.from_sec(0.0);  
  point.time_from_start = rospy.Duration.from_sec(3.0)
  for i in range(0, 6):
    jointCmd.joint_names.append('j2n6s300_joint_'+str(i+1))
    point.positions.append(jointcmds[i])
    point.velocities.append(0)
    point.accelerations.append(0)
    point.effort.append(0) 
  jointCmd.points.append(point)
  rate = rospy.Rate(100)
  count = 0
  while (count < 50):
    pub.publish(jointCmd)
    count = count + 1
    rate.sleep()     
  time.sleep(3)

def moveFingers (jointcmds):
  topic_name = '/j2n6s300/effort_finger_trajectory_controller/command'
  pub = rospy.Publisher(topic_name, JointTrajectory, queue_size=1)  
  jointCmd = JointTrajectory()  
  point = JointTrajectoryPoint()
  jointCmd.header.stamp = rospy.Time.now() + rospy.Duration.from_sec(0.0);  
  point.time_from_start = rospy.Duration.from_sec(15.0)
  for i in range(0, 3):
    jointCmd.joint_names.append('j2n6s300_joint_finger_'+str(i+1))
    point.positions.append(jointcmds[i])
    point.velocities.append(0)
    point.accelerations.append(0)
    point.effort.append(0) 
  jointCmd.points.append(point)
  rate = rospy.Rate(100)
  count = 0
  while (count < 500):
    pub.publish(jointCmd)
    count = count + 1
    rate.sleep()     
    
    

if __name__ == '__main__':
  try:    
    rospy.init_node('move_robot_using_trajectory_msg')		
    prefix = "j2n6s300"

    #allow gazebo to launch
    #time.sleep(0.5)

    # Unpause the physics
    #rospy.wait_for_service('/gazebo/unpause_physics')
    #unpause_gazebo = rospy.ServiceProxy('/gazebo/unpause_physics', Empty)
    #resp = unpause_gazebo()
    moveJoint ([2,    3,      2 ,    0.2,     1.4,     0.0])

   # moveFingers ([1,1,1])
  except rospy.ROSInterruptException:
    print "program interrupted before completion"
