

import matplotlib.pyplot as plt
 
class DynamicGraphPlot(object):
    def __init__(self, agent): 
        self.xdata = []
        self.ydata = [] 
        plt.show() 
        self.ax = plt.gca()              
        self.ax.set_title(agent, fontsize=15, fontweight='bold')
        self.ax.set_ylabel('Rolling Episode Scores')
        self.ax.set_xlabel('Episode Number')
        self.line, = self.ax.plot(self.xdata, self.ydata, 'b-')  
     
    def update_plot(self, episode, score):
        self.xdata.append(episode-1)
        self.ydata.append(score)
        self.ax.set_xlim(1, episode+1)
        y_min = min(self.ydata)
        y_max = max(self.ydata)
        self.ax.set_ylim(y_min-(y_max-y_min)*0.05, y_max+(y_max-y_min)*0.05+0.01)        
        self.line.set_xdata(self.xdata)
        self.line.set_ydata(self.ydata)
        plt.draw()
        plt.pause(1e-17)
 


