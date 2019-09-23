#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState, Imu
#from nav_msgs.msg import Odometry
#from gazebo_msgs.msg import ContactsState
#from std_msgs.msg import Float64
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Point, Quaternion, Vector3
from math import pi


def callback(msg):
    rot = msg.pose.pose.orientation
    (roll, pitch, yaw) = euler_from_quaternion([rot.x, rot.y, rot.z, rot.w])
    roll = round(roll * 180/pi,1)
    pitch = round(pitch * 180/pi,1)
    yaw = round(yaw * 180/pi,1)
    print("odom")
    print(roll,pitch,yaw)
    rospy.Rate(10).sleep()

def imu_callback(msg):
    rot = msg.orientation
    (roll, pitch, yaw) = euler_from_quaternion([rot.x, rot.y, rot.z, rot.w])
    roll = round(roll * 180/pi,1)
    pitch = round(pitch * 180/pi,1)
    yaw = round(yaw * 180/pi,1)
    #print("Imu")
    print(roll,pitch,yaw)
    #print("=====================")
    #rospy.Rate(25).sleep()

def contact_callback(msg):
    contactstate = msg.states
    print(msg.states)
    #if not contactstate == None:
    #    print(contactstate.contact_normals)
    rospy.Rate(10).sleep()

def imu_callback2(msg):
    euler_rpy = Vector3()
    base_orientation = msg.orientation
    euler = euler_from_quaternion(
        [base_orientation.x, base_orientation.y, base_orientation.z, base_orientation.w])

    euler_rpy.x = euler[0]
    euler_rpy.y = euler[1]
    euler_rpy.z = euler[2]
    roll = round(euler[0] * 180/pi,1)
    pitch = round(euler[1] * 180/pi,1)
    yaw = round(euler[2] * 180/pi,1)
    print(str(roll)+" / "+str(pitch)+" / "+str(yaw))

rospy.init_node('laser_scan')
#sub = rospy.Subscriber('/odom', Odometry, callback)
sub2 = rospy.Subscriber('/monoped/imu/data', Imu, imu_callback)
#contact_sub = rospy.Subscriber('/lowerleg_contactsensor_state', ContactsState, contact_callback)

rospy.spin()