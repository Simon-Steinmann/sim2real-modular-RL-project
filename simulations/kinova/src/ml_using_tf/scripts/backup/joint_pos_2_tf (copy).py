#! /usr/bin/env python

import rospy
from tf import transformations
from geometry_msgs.msg import TransformStamped, Transform
from tf2_msgs.msg import TFMessage
from ros_numpy import numpify, msgify
import xml.etree.ElementTree as ET
import time
import numpy as np
from sensor_msgs.msg import JointState

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
                        print name, len(self.urdf_transforms)
                        rpy = elem.attrib.get('rpy') #elem.items(), 
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
            self.urdf_transform_matricies.append(numpify(transform.transform))
        
    def calculate_joints(self, position):
       
        self.joint_angle_matricies = []
        for angle in position:
            self.joint_angle_matricies.append(transformations.euler_matrix(0, 0, angle))
        T_c = [np.identity(4)]
        tf_msg = TFMessage() 
        for index in xrange(len(self.urdf_transform_matricies)):
            urdf_transform_matrix = self.urdf_transform_matricies[index]
            joint_angle_matrix = self.joint_angle_matricies[index]
            transform_matrix = np.dot(urdf_transform_matrix, joint_angle_matrix)
            
            tf_stamp = TransformStamped()
            tf_stamp.child_frame_id = self.urdf_transforms[index].child_frame_id
            tf_stamp.header.frame_id = self.urdf_transforms[index].header.frame_id
            if index in (8, 10): #sets parent of fingers to link6
                index = 6
            T_c.append(np.dot(T_c[index], transform_matrix))
            
            
            tf_stamp.transform = msgify(Transform, T_c[-1])
            #tf_stamp.transform = msgify(Transform, transform_matrix)
            tf_msg.transforms.append(tf_stamp)
            #print transforms.header
            #print link_states.name[-1]
            #print link_states.pose[-1]
            #print '-----------------------------------------------'
        
        return tf_msg
    
    def get_urdf_trans_mats(self):
        return self.urdf_transform_matricies
    
    def get_urdf_trans(self):
        return self.urdf_transforms
        
        
        
        
if __name__ == "__main__":
    rospy.init_node('tf_topic_subscriber', log_level=rospy.INFO)
    Pos2Tf = Pos2Tf()
    n = 0
    timer = time.time()
    pub = rospy.Publisher("joint_states", JointState, queue_size=1)
    joint_names =  ['j2n6s300_joint_1', 'j2n6s300_joint_2', 'j2n6s300_joint_3', 'j2n6s300_joint_4', 'j2n6s300_joint_5',
              'j2n6s300_joint_6', 'j2n6s300_joint_finger_1', 'j2n6s300_joint_finger_tip_1', 'j2n6s300_joint_finger_2',
              'j2n6s300_joint_finger_tip_2', 'j2n6s300_joint_finger_3', 'j2n6s300_joint_finger_tip_3']    
              
    joint_state = JointState()
    joint_state.name = joint_names          
    joint_state.position = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 0, 0, 0, 0.0, 0.0, 0.0] 
    while not rospy.is_shutdown():
        rospy.sleep(1)
        pub.publish(joint_state)
        n += 14
        tf_msg = Pos2Tf.calculate_joints( [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 0, 0, 0, 0.0, 0.0, 0.0] )
        print tf_msg
        #rospy.sleep(1)
        if n == 1000:
            print 1000/(time.time() - timer)
            timer = time.time()
            n=0
    rospy.spin()
