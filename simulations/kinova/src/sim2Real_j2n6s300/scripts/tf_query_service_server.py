#!/usr/bin/env python  


import rospy
import math
import tf
from geometry_msgs.msg import Pose, PoseArray
from j2n6s300_ml.msg import JointOdom
import turtlesim.srv
import time
import threading
from j2n6s300_ml.srv import tfQuery, tfQueryResponse
import numpy as np



class tfQueryService:
    def __init__(self):
    
        rospy.init_node('jaco2_tf_query_service_server')
        self.listener = tf.TransformListener(True, rospy.Duration(10.0))
        self.frame_list = ['root',
            'j2n6s300_link_1', 'j2n6s300_link_2','j2n6s300_link_3', 'j2n6s300_link_4','j2n6s300_link_5', 'j2n6s300_link_6', #1-6
            'j2n6s300_link_finger_1', 'j2n6s300_link_finger_2', 'j2n6s300_link_finger_3',  #7-9
            'j2n6s300_link_finger_tip_1', 'j2n6s300_link_finger_tip_2', 'j2n6s300_link_finger_tip_3'] #10-12
        self.lock = threading.Lock()
        self.thread = threading.Thread(target=self.get_tf)
        self.thread.start()
        self.poses_pub = rospy.Publisher("j2n6s300/joint_poses", PoseArray, queue_size=50)
        self.twist_pub = rospy.Publisher("j2n6s300/joint_vel", JointOdom, queue_size=50)
        s = rospy.Service('jaco_tf_query', tfQuery, self.return_tf_query)        
        print "joints_states_listener server started, waiting for queries"
        
        
        
    def get_tf(self): 
        self.pose = Pose()
        self.frame_poses    = PoseArray()
        self.old_poses_list = []
        self.old_poses    = PoseArray()
        old_x = old_y = old_z = [0,0,0,0,0,0,0,0]
        time.sleep(.7)
        while not rospy.is_shutdown():
            vel_array=[]
            self.old_poses = self.frame_poses
            self.frame_poses    = PoseArray()
            self.frame_poses.header.stamp = rospy.Time.now()
            self.frame_poses.header.frame_id = '0=root____1-6=ArmJoints____7-9=Finger____10-12=FingerTip'

            try:
                for  name in self.frame_list:
                    (tran,rot) = self.listener.lookupTransform('root', name,   rospy.Time(0))
                    (tran2,rot2) = self.listener.lookupTransform('root', name,   self.frame_poses.header.stamp - rospy.Duration.from_sec(.5) )
                    self.pose.position.x = tran[0]
                    self.pose.position.y = tran[1]
                    self.pose.position.z = tran[2]
                    self.pose.orientation.x = rot[0]
                    self.pose.orientation.y = rot[1]
                    self.pose.orientation.z = rot[2]
                    self.pose.orientation.w = rot[3]
                    distance = math.sqrt((tran[0]-tran2[0])**2+(tran[1]-tran2[1])**2+(tran[2]-tran2[2])**2)
                    vel = float(distance/.5)
                    vel_array.append(vel)
                    self.frame_poses.poses.append(self.pose)                      
                    self.poses_pub.publish(self.frame_poses)
                    self.twist_pub.publish(JointOdom())

                        
            except Exception as e:
                rospy.logerr(e)
                time.sleep(1)
                continue      
            print(vel_array)        
            rospy.Rate(10).sleep()
        rospy.spin()   
         
        
    def return_tf_query(self, req):
        self.lock.acquire()
        
        #response = tfQueryResponse()
        #response.success = True
        #posearray = PoseArray()
        #posearray.header = self.frame_poses.header
        #for i in xrange(len(self.frame_poses.poses)):
         #   print("POSE INDEX: "+str(i))
          #  print(self.frame_poses.poses[i])
           # posearray.poses.append(self.frame_poses.poses[i])
        return tfQueryResponse(True, self.frame_poses)
        #return tfQueryResponse(response)
        self.lock.release()
        
if __name__ == '__main__':
    tfquery_object = tfQueryService()

    
    rospy.spin()