
#include <ros/ros.h>
#include <collision_check/CheckJointStateCollision.h>

// MoveIt
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/planning_scene/planning_scene.h>
#include <moveit/kinematic_constraints/utils.h>


// Service
bool service_callback(collision_check::CheckJointStateCollision::Request  &req,
         collision_check::CheckJointStateCollision::Response &res)
{
  // initialise variables once
  static collision_detection::CollisionRequest collision_request;
  static collision_detection::CollisionResult collision_result;
  static robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
  static robot_model::RobotModelPtr kinematic_model = robot_model_loader.getModel();
  static planning_scene::PlanningScene planning_scene(kinematic_model);
  static robot_state::RobotState& current_state = planning_scene.getCurrentStateNonConst();
  

  // set the current state to the service request
  current_state.setVariablePositions(req.joint_state.name, req.joint_state.position);

  //
  collision_request.contacts = true;
  collision_request.max_contacts = 1000;
  collision_result.clear();
  planning_scene.checkSelfCollision(collision_request, collision_result);
  ROS_INFO_STREAM("Test 5: Current state is " << (collision_result.collision ? "in" : "not in") << " self collision");
  collision_detection::CollisionResult::ContactMap::const_iterator it;
  for (it = collision_result.contacts.begin(); it != collision_result.contacts.end(); ++it)
  {
	ROS_INFO("Contact between: %s and %s", it->first.first.c_str(), it->first.second.c_str());
  }

  res.success = collision_result.collision;
  res.info = "Contact between: %s and %s", it->first.first.c_str(), it->first.second.c_str();
  return true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "z_service_server_GetStateValidity");
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("z_service_GetStateValidity", service_callback);
  ROS_INFO("Ready to add two ints.");
  ros::spin();

  return 0;
}


