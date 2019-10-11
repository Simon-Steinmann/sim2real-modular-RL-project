#! /usr/bin/env python
import rospy
import time
#from moveit_msgs.srv import GetStateValidity, GetStateValidityRequest # you import the service message python classes
from collision_check.srv import CheckJointStateCollision, CheckJointStateCollisionRequest

joint_names =  ['j2n6s300_joint_1', 'j2n6s300_joint_2', 'j2n6s300_joint_3', 'j2n6s300_joint_4', 'j2n6s300_joint_5',
              'j2n6s300_joint_6', 'j2n6s300_joint_finger_1', 'j2n6s300_joint_finger_tip_1', 'j2n6s300_joint_finger_2',
              'j2n6s300_joint_finger_tip_2', 'j2n6s300_joint_finger_3', 'j2n6s300_joint_finger_tip_3']  
init_pose = [0.0, 2.9, 1.3, -2.07, 1.4, 0.0, 0, 0, 0, 0, 0, 0.0] 

rospy.init_node('z_service_client') # Initialise a ROS node with the name service_client
rospy.wait_for_service('/z_service_GetStateValidity') # Wait for the service client /move_bb8_in_circle to be running
service = rospy.ServiceProxy('/z_service_GetStateValidity', CheckJointStateCollision) # Create the connection to the service
service_object = CheckJointStateCollisionRequest() # Create an object of type EmptyRequest
service_object.joint_state.name = joint_names
service_object.joint_state.position = init_pose
print(service_object)
timer = time.time()
for i in range(1000):
    result = service(service_object) # Send through the connection the path to the trajectory file to be executed
    print(result) # Print the result given by the service called
print(1000/(time.time()-timer))