import random
from math import pi
from joint_pos_2_tf import Pos2Tf 
import numpy 
import pickle
import sys
sys.path = ['', '', '/home/simon/catkin_ws/src/ml_using_tf/scripts', '/home/simon/anaconda3/envs/py35/lib/python3.5/site-packages', '/home/simon/catkin_ws', '/home/simon/simon/anaconda3/envs/py35/lib/python3.5/site-packages', '/home/simon/35catkin_ws/devel/lib/python3/dist-packages', '/opt/ros/melodic/lib/python2.7/dist-packages', '/home/simon/anaconda3/envs/py35/lib/python35.zip', '/home/simon/anaconda3/envs/py35/lib/python3.5', '/home/simon/anaconda3/envs/py35/lib/python3.5/plat-linux', '/home/simon/anaconda3/envs/py35/lib/python3.5/lib-dynload', '/home/simon/35catkin_ws/src/baselines', '/home/simon/anaconda3/envs/py35/lib/python3.5/site-packages/IPython/extensions', '/home/simon/.ipython']




if __name__ == "__main__":
    number_of_observations = 500000  
    number_of_joints = 6  
    
    obs_buffer = []
    tf_obj = Pos2Tf()
    joint_pos = [0]*6   
    counter = 0
    for n in range(number_of_observations):
        counter += 1
        if counter > number_of_observations/100:
            done = n / number_of_observations * 100
            print("Progress: " +str(round(done,0)) + '%')
            counter = 0
        obs =  numpy.zeros(8*number_of_joints)
        for i in range(number_of_joints):
            joint_pos[i] = random.uniform(-pi,pi)
        tf_msg = tf_obj.calculate_joints(joint_pos, number_of_joints)        
        for  i in range(6):
            tran = tf_msg[i].transform.translation
            rot = tf_msg[i].transform.rotation
            obs[i*8+0] = round(tran.x,3)
            obs[i*8+1] = round(tran.y,3)
            obs[i*8+2] = round(tran.z,3)
            obs[i*8+3] = round(rot.x,3)
            obs[i*8+4] = round(rot.y,3)
            obs[i*8+5] = round(rot.z,3)
            obs[i*8+6] = round(rot.w,3)
            obs[i*8+7] = round(joint_pos[i],3)
        obs_buffer.append(obs)
    with open('/home/simon/observation.data', 'wb') as filehandle:
        pickle.dump(obs_buffer, filehandle)
    print('DONE')
            
