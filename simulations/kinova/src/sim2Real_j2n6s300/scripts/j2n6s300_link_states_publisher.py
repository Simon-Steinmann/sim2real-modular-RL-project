#!/usr/bin/env python  


import rospy
import math
import tf
from geometry_msgs.msg import Pose, Twist
#from j2n6s300_ml.msg import JointOdom
from gazebo_msgs.msg import LinkStates
import turtlesim.srv
import time
import threading
import numpy as np



class LinkStatesPublisher:
    def __init__(self):
    
        rospy.init_node('jaco2_tf_query_service_server')
        self.listener = tf.TransformListener(True, rospy.Duration(10.0))
        self.frame_list = ['root',
            'j2n6s300_link_1', 'j2n6s300_link_2','j2n6s300_link_3', 'j2n6s300_link_4','j2n6s300_link_5', 'j2n6s300_link_6', #1-6
            'j2n6s300_link_finger_1', 'j2n6s300_link_finger_2', 'j2n6s300_link_finger_3',  #7-9
            'j2n6s300_link_finger_tip_1', 'j2n6s300_link_finger_tip_2', 'j2n6s300_link_finger_tip_3'] #10-12
        self.twist_pub = rospy.Publisher("j2n6s300/link_states", LinkStates, queue_size=50)
        self.delta_t = 0.005
        self.get_tf()       
     

    def get_tf(self): 
        rospy.logwarn( "Publishing /j2n6s300/link_states. Works with real and simulated j2n6s300 robot")
        pose = Pose()
        twist = Twist
        time.sleep(.7) #wait for listener buffer to fill
        while not rospy.is_shutdown():            
            msg = LinkStates()
            msg.name = self.frame_list
            query_rostime = self.listener.getLatestCommonTime('root','j2n6s300_link_finger_tip_3')

            try:
                for  name in self.frame_list:
                    i = self.frame_list.index(name)
                    (tran,rot) = self.listener.lookupTransform('root', name,   query_rostime)
                    (tran2,rot2) = self.listener.lookupTransform('root', name,  query_rostime - rospy.Duration.from_sec(self.delta_t) )
                    msg.pose.append(Pose())
                    msg.twist.append(Twist())
                    msg.pose[i].position.x = tran[0]
                    msg.pose[i].position.y = tran[1]
                    msg.pose[i].position.z = tran[2]
                    msg.pose[i].orientation.x = rot[0]
                    msg.pose[i].orientation.y = rot[1]
                    msg.pose[i].orientation.z = rot[2]
                    msg.pose[i].orientation.w = rot[3]
                    msg.twist[i].linear.x = (tran[0]-tran2[0])/self.delta_t
                    msg.twist[i].linear.y = (tran[1]-tran2[1])/self.delta_t
                    msg.twist[i].linear.z = (tran[2]-tran2[2])/self.delta_t
                    #distance = math.sqrt((tran[0]-tran2[0])**2+(tran[1]-tran2[1])**2+(tran[2]-tran2[2])**2)
                    #vel = float(distance/.5)                        
            except Exception as e:
                rospy.logerr(e)
                time.sleep(1)
                continue      

            
            self.twist_pub.publish(msg)    
            rospy.Rate(25).sleep()
        rospy.spin()   
         

if __name__ == '__main__':
    tfquery_object = LinkStatesPublisher()    
    rospy.spin()