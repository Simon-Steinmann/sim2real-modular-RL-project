import numpy as np
joints = ['j2n6s300_joint_1',  'j2n6s300_joint_2',  'j2n6s300_joint_3',  'j2n6s300_joint_4',  'j2n6s300_joint_5', 
  'j2n6s300_joint_6',  'j2n6s300_joint_finger_1',  'j2n6s300_joint_finger_2',  'j2n6s300_joint_finger_3', 
  'j2n6s300_joint_finger_tip_1',  'j2n6s300_joint_finger_tip_2',  'j2n6s300_joint_finger_tip_3']


"""
obs = [
            #The following is available for each joint (x12 in total). Reference is the world frame
            Joint[0-11]
                .pose 
                    .position
                        .x #value 1    accuracy approx: 0.001 m
                        .y #value 2    accuracy approx: 0.001 m
                        .z #value 3    accuracy approx: 0.001 m
                    .orientation
                        .x #value 4    accuracy hard to say, perhaps we should do 0.1 degree = 0.0017 radians, or 10^-3, no idea what that is in quaternion
                        .y #value 5
                        .z #value 6
                        .w #value 7
                .twist #should not really matter when controlling via positioins,  as we stop after each step,  before assigning the observation space values
                    .linear
                        .x #value 8    accuracy approx: 10^-5 m/s 
                        .y #value 9    accuracy approx: 10^-5 m/s 
                        .z #value 10    accuracy approx: 10^-5 m/s 
                    .angular
                        .x #value 11    accuracy approx: 10^-5 Rad/s 
                        .y #value 12    accuracy approx: 10^-5 Rad/s 
                        .z #value 13    accuracy approx: 10^-5 Rad/s 
            #The following is available for each joint (x12 in total). 
            Joint[0-11]
                .position #value 14     #Joint angle,  controllable through driver                
                .velocity #value 15    accuracy approx: 10^-5 m/s 
                .effor #value 16    accuracy approx: 10^-5
                    
            ]
"""           
obs_space = np.zeros((2,12*16))
obs_per_joint=np.array([
        [-2, -2, 0, -1, -1, -1, -1, -np.inf, -np.inf, -np.inf, -np.inf, -np.inf, -np.inf, -np.inf, -np.inf, -np.inf],
        [2, 2, 2, 1, 1, 1, 1, np.inf, np.inf, np.inf, np.inf, np.inf, np.inf, np.inf, np.inf, np.inf]])
        

for i in xrange(12):   
        for x in xrange(16):
            obs_space[0,i*16+x] = obs_per_joint[0,x]
            obs_space[1,i*16+x] = obs_per_joint[1,x]
    
#self.observation_space = spaces.Box(obs_space[0, :],  obs_space[1, :])       
 
print(obs_space)