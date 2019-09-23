# sim2Real_j2n6s300
# jaco2_Sim2Real


## Installation
### install Git
```bash
sudo apt update
sudo apt upgrade
sudo apt install git
```

### install Ros Melodic
```bash
#install Ros Melodic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-melodic-desktop-full
sudo rosdep init
rosdep update
#install dependencies
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
#installing controllers
sudo apt-get install ros-melodic-ros-controllers*
```

### install Moveit 
```bash
sudo apt-get install ros-melodic-moveit
sudo apt-get install ros-melodic-trac-ik
```

### install pip and gym 
```bash
sudo apt install python-pip
pip install gym
```

### set up catkin workstpace
```bash
source ~/.bashrc
cd ~
mkdir catkin_ws
cd catkin_ws
mkdir src
cd src
git clone https://github.com/christian-rauch/kinova-ros.git
git clone https://bitbucket.org/theconstructcore/openai_ros.git
git clone https://github.com/Simon-Steinmann/sim2Real_j2n6s300.git
cd ~/catkin_ws/
catkin_make
rosdep install --from-paths src --ignore-src --rosdistro melodic -y
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```
