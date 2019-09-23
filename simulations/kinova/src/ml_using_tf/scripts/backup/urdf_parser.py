#! /usr/bin/env python
import rospy
from tf import transformations
from geometry_msgs.msg import TransformStamped
from ros_numpy import numpify, msgify
import xml.etree.ElementTree as ET

class UrdfParser(object):
    def __init__(self):   
        root = ET.fromstring(rospy.get_param('/robot_description'))
        self.urdf_transforms = []
        for child in root:
            if child.tag == 'joint' and not child.attrib.get('type') == 'fixed':
                for elem in child:
                    if elem.tag == 'origin':
                        name =  child.attrib.get('name')
                        print name, len(self.urdf_transforms)
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
                        self.urdf_transforms.append(trans)
                        
        arr = self.urdf_transforms
        self.urdf_transforms[7] = arr[8]         
        self.urdf_transforms[8] = arr[10]       
        self.urdf_transforms[9] = arr[7]       
        self.urdf_transforms[10] = arr[9]  
        self.urdf_transform_matricies = []
        for  transform in self.urdf_transforms:
            #print transform
            self.urdf_transform_matricies.append(numpify(transform.transform))
            
    def get_urdf_trans_mats(self):
        return self.urdf_transform_matricies
    
    def get_urdf_trans(self):
        return self.urdf_transforms