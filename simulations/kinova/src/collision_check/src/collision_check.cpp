/*********************************************************************
 * Software License Agreement (BSD License)
 *
 *  Copyright (c) 2012, Willow Garage, Inc.
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   * Neither the name of Willow Garage nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *********************************************************************/

/* Author: Sachin Chitta, Michael Lautman */

#include <ros/ros.h>
#include  <moveit_msgs/GetStateValidity.h>
// MoveIt
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/planning_scene/planning_scene.h>
#include <sensor_msgs/JointState.h>
#include <moveit/kinematic_constraints/utils.h>

#include <iostream>   // std::cout
#include <string>     // std::string, std::to_string


bool add(moveit_msgs::GetStateValidity::Request  &req,
         moveit_msgs::GetStateValidity::Response &res)
{
  
  ROS_INFO("request:");
  ROS_INFO("sending back response:");
  return true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "z_service_server_GetStateValidity");
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("z_service_GetStateValidity", add);
  ROS_INFO("Ready to add two ints.");
  ros::spin();

  return 0;
}


#include <ros/ros.h>

// MoveIt
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/planning_scene/planning_scene.h>
#include <sensor_msgs/JointState.h>
#include <moveit/kinematic_constraints/utils.h>

#include <iostream>   // std::cout
#include <string>     // std::string, std::to_string



class SubscribeAndPublish
{


public:
  SubscribeAndPublish()
  {
    //Topic you want to publish
    //pub_ = n_.advertise<gazebo_msgs::ContactsState>("/z_collisions_cpp", 1);

    //Topic you want to subscribe
    sub_ = n_.subscribe("j2n6s300/joint_states", 1, &SubscribeAndPublish::callback, this);
  }

  void callback(const sensor_msgs::JointState& msg)
  {
	  static robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
	  static robot_model::RobotModelPtr kinematic_model = robot_model_loader.getModel();
	  static planning_scene::PlanningScene planning_scene(kinematic_model);
	  static robot_state::RobotState& current_state = planning_scene.getCurrentStateNonConst();

	  current_state.setVariablePositions(msg.name, msg.position);

	  collision_request.contacts = true;
	  collision_request.max_contacts = 1000;

	  //

	  collision_result.clear();
	  planning_scene.checkSelfCollision(collision_request, collision_result);
	  ROS_INFO_STREAM("Test 5: Current state is " << (collision_result.collision ? "in" : "not in") << " self collision");
	  collision_detection::CollisionResult::ContactMap::const_iterator it;
	  for (it = collision_result.contacts.begin(); it != collision_result.contacts.end(); ++it)
	  {
		ROS_INFO("Contact between: %s and %s", it->first.first.c_str(), it->first.second.c_str());
	  }
  }

private:
  ros::NodeHandle n_; 
  ros::Publisher pub_;
  ros::Subscriber sub_;
  collision_detection::CollisionRequest collision_request;
  collision_detection::CollisionResult collision_result;



};//End of class SubscribeAndPublish

int main(int argc, char **argv)
{
  //Initiate ROS
  ros::init(argc, argv, "subscribe_and_publish");

  //Create an object of class SubscribeAndPublish that will take care of everything
  ROS_INFO("----------------------------------------------------------------------");
  SubscribeAndPublish SAPObject;

  ros::spin();

  return 0;
}


