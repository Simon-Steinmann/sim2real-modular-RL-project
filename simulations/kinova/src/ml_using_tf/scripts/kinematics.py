import random
import ikpy
import numpy as np
from math import pi, sin, cos, acos
from ikpy import plot_utils
import matplotlib.pyplot as plt
import pptk 
from mpl_toolkits.mplot3d import Axes3D


class Jaco2Kinematics(object):
    def __init__(self):
        self.links1 = ikpy.URDF_utils.get_urdf_parameters(
        '/home/simon/sim2real/simulations/kinova/src/ml_using_tf/urdf/j2n6s300.xarco', 
        ["j2n6s300_link_base"] )
        self.chain1 = ikpy.chain.Chain(
            links=self.links1,
            active_links_mask=[ True, True, True, True, True, True, False],
            name='j2n6s300')
        self.target_array = np.identity(4)
       
       
    def Target2JointPos(self, xyz=[0.5, 0.5, 0.5]):
        self.target_array[0,3] = xyz[0]
        self.target_array[1,3] = xyz[1]
        self.target_array[2,3] = xyz[2]   
        calc_pos = self.chain1.inverse_kinematics(self.target_array)
        JointPos = np.zeros(12)         
        for i in range(len(calc_pos)):
            JointPos[i] += calc_pos[i]        
        return(JointPos)  
        
    def JointPos2Target(self, JointPos):
        return(self.chain1.forward_kinematics(JointPos))  
        
    def RandomPoint(self,x_lim=[0,1], y_lim=[0,1], z_lim=[0,1]):
        x = random.uniform(x_lim[0],x_lim[1])
        y = random.uniform(y_lim[0],y_lim[1])
        z = random.uniform(z_lim[0],z_lim[1])
        Point=[x,y,z]
        return(Point)
        
    def RandomPointInSphere(self, inner_radius=0, outer_radius=1, center_point=[0,0,0]):
        phi = random.uniform(0,2*pi)
        costheta = random.uniform(-1,1)
        u = random.uniform(inner_radius/outer_radius, 1)        
        theta = acos( costheta )
        r = outer_radius * pow( u , 1/3)
        x = r * sin( theta) * cos( phi ) + center_point[0]
        y = r * sin( theta) * sin( phi ) + center_point[1]
        z = r * cos( theta ) + center_point[2]
        return([x,y,z])
        
    
                        
if __name__ == "__main__":
    obj = Jaco2Kinematics()
    #print(obj.Target2JointPos([1,1,1]))
    fig = plt.figure()
    ax = Axes3D(fig)
    
    for i in range(2000):
        #print(obj.RandomPointInSphere(0.1,[1,1,1]))
        (x, y, z) =obj.RandomPointInSphere(0.2,0.3,[0,0.5,0.5])
        ax.scatter(x, y, z , s=1, c='blue')
    fig.savefig('result.png')
    plt.show()
        