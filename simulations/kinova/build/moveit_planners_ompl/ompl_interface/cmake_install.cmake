# Install script for directory: /home/acis/sim2real/simulations/kinova/src/moveit/moveit_planners/ompl/ompl_interface

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
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_interface.so.1.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_interface.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib/libmoveit_ompl_interface.so.1.0.1"
    "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib/libmoveit_ompl_interface.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_interface.so.1.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_interface.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/acis/sim2real/simulations/kinova/devel/.private/geometric_shapes/lib:/opt/ros/melodic/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_planning/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_core/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_planner_plugin.so.1.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_planner_plugin.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib/libmoveit_ompl_planner_plugin.so.1.0.1"
    "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib/libmoveit_ompl_planner_plugin.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_planner_plugin.so.1.0.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_ompl_planner_plugin.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_planning/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_core/lib:/home/acis/sim2real/simulations/kinova/devel/.private/geometric_shapes/lib:/opt/ros/melodic/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/moveit_ompl_planner" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/moveit_ompl_planner")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/moveit_ompl_planner"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl" TYPE EXECUTABLE FILES "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib/moveit_planners_ompl/moveit_ompl_planner")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/moveit_ompl_planner" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/moveit_ompl_planner")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/moveit_ompl_planner"
         OLD_RPATH "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib:/home/acis/sim2real/simulations/kinova/devel/.private/geometric_shapes/lib:/opt/ros/melodic/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_planning/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_core/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/moveit_ompl_planner")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/generate_state_database" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/generate_state_database")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/generate_state_database"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl" TYPE EXECUTABLE FILES "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib/moveit_planners_ompl/generate_state_database")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/generate_state_database" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/generate_state_database")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/generate_state_database"
         OLD_RPATH "/home/acis/sim2real/simulations/kinova/devel/.private/moveit_planners_ompl/lib:/home/acis/sim2real/simulations/kinova/devel/.private/geometric_shapes/lib:/opt/ros/melodic/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_planning/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_ros_occupancy_map_monitor/lib:/home/acis/sim2real/simulations/kinova/devel/.private/moveit_core/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/moveit_planners_ompl/generate_state_database")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/acis/sim2real/simulations/kinova/src/moveit/moveit_planners/ompl/ompl_interface/include/")
endif()

