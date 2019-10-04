## Kinova Plugin
This ROS-Gazebo plugin provides an interface for sending joint effort commands
to the robot as well as reading the joint states directly from Gazebo.

This plugin is essential if one wants to do a Computed Torque control or Feedforward
control on the robot. Because, `JointEffortController` is not performing well and also `JointStateController` is publishing wrong velocities and effort in many cases.
Look [here](https://github.com/jacknlliu/development-issues/issues/27) for more information on this issue.

In order to use this plugin, the regular ros-control controllers must not be launched. So to bring up the 6 DOF Jaco 2 arm the following command must be used: </br>
` roslaunch kinova_gazebo robot_launch.launch kinova_robotType:=j2n6s300 use_ros_control:=false`
