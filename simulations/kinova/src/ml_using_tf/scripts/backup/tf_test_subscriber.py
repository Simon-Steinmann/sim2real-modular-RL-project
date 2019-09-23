#! /usr/bin/env python

import rospy
from tf2_msgs.msg import TFMessage
from std_msgs.msg import Header
import numpy as np
import tf2_ros
import tf2_geometry_msgs 
from tf import transformations
from geometry_msgs.msg import Transform, Vector3, Quaternion, Point, Pose, TransformStamped
from ros_numpy import numpify, msgify
from gazebo_msgs.msg import LinkStates
import xml.etree.ElementTree as ET
import time
from urdf_parser import UrdfParser

'''
root = ET.fromstring(rospy.get_param('/robot_description'))
urdf_transforms = []
for child in root:
    if child.tag == 'joint' and not child.attrib.get('type') == 'fixed':
        for elem in child:
            if elem.tag == 'origin':
                name =  child.attrib.get('name')
                print name, len(urdf_transforms)
                rpy = elem.attrib.get('rpy') #elem.items(), 
                xyz = elem.attrib.get('xyz')                 
                rpy_arr = [float(x) for x in  rpy.split(' ')]
                xyzw_arr =  transformations.quaternion_from_euler(rpy_arr[0], rpy_arr[1], rpy_arr[2]) 
                xyz_arr = [float(x) for x in  xyz.split(' ')]
                trans = TransformStamped()
                trans.child_frame_id = name
                trans.transform.translation.x = xyz_arr[0]
                trans.transform.translation.y = xyz_arr[1]
                trans.transform.translation.z = xyz_arr[2]
                trans.transform.rotation.x =  xyzw_arr[0]    
                trans.transform.rotation.y =  xyzw_arr[1]    
                trans.transform.rotation.z =  xyzw_arr[2]    
                trans.transform.rotation.w =  xyzw_arr[3]    
                urdf_transforms.append(trans)
                
arr = urdf_transforms
urdf_transforms[7] = arr[8]         
urdf_transforms[8] = arr[10]       
urdf_transforms[9] = arr[7]       
urdf_transforms[10] = arr[9]  
urdf_tranform_matricies = []
for  transform in urdf_transforms:
    #print transform
    urdf_tranform_matricies.append(numpify(transform.transform))
  '''  
#print urdf_tranform_matricies         
        
class TfTopicReader(object):
    def __init__(self):
        self._tfdata = TFMessage()
        rospy.loginfo("TfTopicReader  is ready")
        #self._sub = rospy.Subscriber('/tf', TFMessage, self.topic_callback,  queue_size=1000 )
        self.pub = rospy.Publisher("link_states", LinkStates, queue_size=10)
        self.init_positions = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 1, 1, 1, 0.0, 0.0, 0.0] 
        self.joint_angle_matricies = []
        for angle in self.init_positions:
            self.joint_angle_matricies.append(transformations.euler_matrix(0, 0, angle))
        parser = UrdfParser()
        self.urdf_tranform_matricies = parser.get_urdf_trans_mats()
        self.urdf_transforms = parser.get_urdf_trans()
        #print transformations.quaternion_from_euler(0, 3.14159265359, 0)
        #print len(self.joint_angle_matricies)

    def topic_callback(self):
        T_c = [np.identity(4)]
        link_states = LinkStates()        
        for index in xrange(len(self.urdf_tranform_matricies)):
            urdf_transform_matrix = self.urdf_tranform_matricies[index]
            joint_angle_matrix = self.joint_angle_matricies[index]
            transform_matrix = np.dot(urdf_transform_matrix, joint_angle_matrix)
            if index in (6, 7, 8): #sets parent of fingers to link6
                index = 6
            elif index in (9, 10, 11):#sets parent of fingertip
                index -= 2
            T_c.append(np.dot(T_c[index], transform_matrix))
            link_states.pose.append(msgify(Pose, T_c[-1]))
            link_states.name.append(self.urdf_transforms[index].child_frame_id)
            #transforms.header.frame_id = transforms.child_frame_id
            #print transforms.header
            #print link_states.name[-1]
            #print link_states.pose[-1]
            #print '-----------------------------------------------'
        self.pub.publish(link_states)
        #print link_states
        

if __name__ == "__main__":
    rospy.init_node('tf_topic_subscriber', log_level=rospy.INFO)
    TfTopicReader = TfTopicReader()
    n = 0
    timer = time.time()
    while not rospy.is_shutdown():
        n += 1
        TfTopicReader.topic_callback()
        if n == 1000:
            print 1000/(time.time() - timer)
            timer = time.time()
            n=0
    rospy.spin()
