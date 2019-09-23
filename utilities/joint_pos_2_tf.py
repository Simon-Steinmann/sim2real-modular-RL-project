#! /usr/bin/env python

import rospy
from tf import transformations
from geometry_msgs.msg import TransformStamped, Transform
from tf2_msgs.msg import TFMessage
from ros_numpy import numpify, msgify
import xml.etree.ElementTree as ET
import numpy as np


class Pos2Tf(object):
    def __init__(self):   
        root = ET.fromstring(rospy.get_param('/robot_description'))

        self.urdf_transforms = []
        for child in root:
            if child.tag == 'joint' and not child.attrib.get('type') == 'fixed':
                for elem in child:
                    if elem.tag == 'parent':                        
                        parent = elem.attrib.get('link')
                    if elem.tag == 'origin':
                        name =  child.attrib.get('name')
                        #print name, len(self.urdf_transforms)
                        rpy = elem.attrib.get('rpy') 
                        xyz = elem.attrib.get('xyz')                 
                        rpy_arr = [float(x) for x in  rpy.split(' ')]
                        xyzw_arr =  transformations.quaternion_from_euler(rpy_arr[0], rpy_arr[1], rpy_arr[2]) 
                        xyz_arr = [float(x) for x in  xyz.split(' ')]
                        trans = TransformStamped()
                        trans.header.frame_id = parent
                        trans.child_frame_id = name
                        trans.transform.translation.x = xyz_arr[0]
                        trans.transform.translation.y = xyz_arr[1]
                        trans.transform.translation.z = xyz_arr[2]
                        trans.transform.rotation.x =  xyzw_arr[0]    
                        trans.transform.rotation.y =  xyzw_arr[1]    
                        trans.transform.rotation.z =  xyzw_arr[2]    
                        trans.transform.rotation.w =  xyzw_arr[3]    
                        self.urdf_transforms.append(trans)
         
  

        self.urdf_transform_matricies = []
        for  transform in self.urdf_transforms:
           self.urdf_transform_matricies.append( numpify(transform.transform))
        self.joint_angle_matricies = np.array([])    
        #print self.urdf_transform_matricies
        #print self.urdf_transforms
            
    def calculate_joints(self, position, num_joints):        
        #create the transformation matricies derived from joint_states
        self.joint_angle_matricies = []
        for i in range(num_joints):
            self.joint_angle_matricies.append(transformations.euler_matrix(0, 0, position[i]))

            
            #np.append(self.transform_matricies, )
        T_c = [np.identity(4)]
        tf_msg = self.urdf_transforms 
        for index in range(num_joints):
            urdf_transform_matrix = self.urdf_transform_matricies[index]
            joint_angle_matrix = self.joint_angle_matricies[index]
            transform_matrix = np.dot(urdf_transform_matrix, joint_angle_matrix)
            

            if index in (8, 10): #sets parent of fingers to link6
                index = 6          
            T_c.append(np.dot(T_c[index], transform_matrix))    
            tf_msg[index].transform = msgify(Transform, T_c[-1])
        return tf_msg
    
    def get_urdf_trans_mats(self):
        return self.urdf_transform_matricies
    
    def get_urdf_trans(self):
        return self.urdf_transforms
        
        
        
        
if __name__ == "__main__":
    rospy.init_node('pos_2_tf_service_server')
    obj = Pos2Tf()
    for i in range(10):
        obj.calculate_joints([0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 0, 0, 0, 0, 0, 0.0] ,12)
    #rospy.spin()