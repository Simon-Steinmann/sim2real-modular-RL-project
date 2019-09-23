#! /usr/bin/env python

import rospy
from joint_pos_2_tf import Pos2Tf
        
        
if __name__ == "__main__":
    rospy.init_node('pos_2_tf_service_server')
    obj = Pos2Tf()
    for i in xrange(1):
        obj.(6)
    #rospy.spin()