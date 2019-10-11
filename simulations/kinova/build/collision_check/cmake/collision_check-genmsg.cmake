# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "collision_check: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(collision_check_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv" NAME_WE)
add_custom_target(_collision_check_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "collision_check" "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv" "sensor_msgs/JointState:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(collision_check
  "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_check
)

### Generating Module File
_generate_module_cpp(collision_check
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_check
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(collision_check_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(collision_check_generate_messages collision_check_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv" NAME_WE)
add_dependencies(collision_check_generate_messages_cpp _collision_check_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_check_gencpp)
add_dependencies(collision_check_gencpp collision_check_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_check_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(collision_check
  "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/collision_check
)

### Generating Module File
_generate_module_eus(collision_check
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/collision_check
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(collision_check_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(collision_check_generate_messages collision_check_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv" NAME_WE)
add_dependencies(collision_check_generate_messages_eus _collision_check_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_check_geneus)
add_dependencies(collision_check_geneus collision_check_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_check_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(collision_check
  "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_check
)

### Generating Module File
_generate_module_lisp(collision_check
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_check
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(collision_check_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(collision_check_generate_messages collision_check_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv" NAME_WE)
add_dependencies(collision_check_generate_messages_lisp _collision_check_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_check_genlisp)
add_dependencies(collision_check_genlisp collision_check_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_check_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(collision_check
  "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/collision_check
)

### Generating Module File
_generate_module_nodejs(collision_check
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/collision_check
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(collision_check_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(collision_check_generate_messages collision_check_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv" NAME_WE)
add_dependencies(collision_check_generate_messages_nodejs _collision_check_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_check_gennodejs)
add_dependencies(collision_check_gennodejs collision_check_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_check_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(collision_check
  "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_check
)

### Generating Module File
_generate_module_py(collision_check
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_check
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(collision_check_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(collision_check_generate_messages collision_check_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/acis/sim2real/simulations/kinova/src/collision_check/srv/CheckJointStateCollision.srv" NAME_WE)
add_dependencies(collision_check_generate_messages_py _collision_check_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_check_genpy)
add_dependencies(collision_check_genpy collision_check_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_check_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_check)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_check
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(collision_check_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(collision_check_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/collision_check)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/collision_check
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(collision_check_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(collision_check_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_check)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_check
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(collision_check_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(collision_check_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/collision_check)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/collision_check
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(collision_check_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(collision_check_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_check)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_check\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_check
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(collision_check_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(collision_check_generate_messages_py sensor_msgs_generate_messages_py)
endif()
