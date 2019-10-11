# Install script for directory: /home/acis/sim2real/simulations/kinova/src/moveit_tutorials/doc/robot_model_and_robot_state

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/acis/sim2real/simulations/kinova/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/robot_model_and_robot_state_tutorial" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/robot_model_and_robot_state_tutorial")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/robot_model_and_robot_state_tutorial"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials" TYPE EXECUTABLE FILES "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_tutorials/lib/moveit_tutorials/robot_model_and_robot_state_tutorial")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/robot_model_and_robot_state_tutorial" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/robot_model_and_robot_state_tutorial")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/robot_model_and_robot_state_tutorial"
         OLD_RPATH "/home/acis/sim2real/simulations/kinova/devel/.private/geometric_shapes/lib:/opt/ros/melodic/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_visual_tools/lib:/home/acis/sim2real/simulations/kinova/devel/.private/rviz_visual_tools/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_planning_interface/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_warehouse/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_manipulation/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_move_group/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_planning/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_perception/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_core/lib:/usr/lib/x86_64-linux-gnu/hdf5/openmpi:/usr/lib/x86_64-linux-gnu/openmpi/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_tutorials/robot_model_and_robot_state_tutorial")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_tutorials" TYPE DIRECTORY FILES "/home/acis/sim2real/simulations/kinova/src/moveit_tutorials/doc/robot_model_and_robot_state/launch")
endif()

