#!/usr/bin/env python  


import rospy
import math
import tf
import geometry_msgs.msg
import turtlesim.srv
import time


if __name__ == '__main__':
    rospy.init_node('turtle_tf_listener')

    listener = tf.TransformListener()
    tf_ros = tf.TransformerROS()
    rate = rospy.Rate(10.0)

    while not rospy.is_shutdown():
       
        try:
            (trans,rot) = listener.lookupTransform('j2n6s300_link_base', 'j2n6s300_link_6',   rospy.Time(0))
        except Exception as e:
                rospy.logwarn(e)
                time.sleep(.1)
                continue       
            

        trans[2] += 0.15675
        #print(rospy.get_rostime )
        print(trans)
        rate.sleep()