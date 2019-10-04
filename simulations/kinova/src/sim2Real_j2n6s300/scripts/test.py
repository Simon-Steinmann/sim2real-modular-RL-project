#! /usr/bin/env python

import rospy
from gazebo_msgs.msg import ContactsState

pub = rospy.Publisher('/z_collide', ContactsState, queue_size=1)


def collision_callback(msg):
    for state in msg.states:
        print(state.collision1_name, state.collision2_name)

rospy.init_node('z_collision_pub')

suv = rospy.Subscriber('/j2n6s300/collision', ContactsState, collision_callback)

rospy.spin()