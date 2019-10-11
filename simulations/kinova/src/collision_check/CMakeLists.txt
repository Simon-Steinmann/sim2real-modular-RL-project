cmake_minimum_required(VERSION 2.8.3)
project(collision_check)

find_package(catkin REQUIRED COMPONENTS
    rospy
    std_msgs
	sensor_msgs
    message_generation

    moveit_core
    moveit_visual_tools
    moveit_ros_planning
    moveit_ros_planning_interface
    moveit_ros_perception
    pluginlib
    geometric_shapes
)

 add_service_files(
   FILES
   CheckJointStateCollision.srv
 )


 generate_messages(
   DEPENDENCIES
   std_msgs  # Or other packages containing msgs
   sensor_msgs
 )

catkin_package(
  CATKIN_DEPENDS 
	moveit_core
#    moveit_visual_tools
#    moveit_ros_planning_interface
#    interactive_markers
#    tf2_geometry_msgs
#  DEPENDS
#    EIGEN3
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

add_executable(planning_scene_tutorial src/planning_scene_tutorial.cpp)
target_link_libraries(planning_scene_tutorial ${catkin_LIBRARIES} ${Boost_LIBRARIES})
install(TARGETS planning_scene_tutorial DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
#add_executable(planning_scene_tutorial src/planning_scene_tutorial.cpp)
#target_link_libraries(planning_scene_tutorial ${catkin_LIBRARIES})


## Build service client and server
# %Tag(SRVCLIENT)%
#add_executable(planning_scene_tutorial src/planning_scene_tutorial.cpp)
#target_link_libraries(planning_scene_tutorial ${catkin_LIBRARIES})
#add_dependencies(planning_scene_tutorial beginner_tutorials_gencpp)


# %EndTag(SRVCLIENT)%

# %EndTag(FULLTEXT)%
