# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "j2n6s300_ml: 1 messages, 1 services")

set(MSG_I_FLAGS "-Ij2n6s300_ml:/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(j2n6s300_ml_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg" NAME_WE)
add_custom_target(_j2n6s300_ml_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "j2n6s300_ml" "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg" "std_msgs/String:geometry_msgs/Twist:geometry_msgs/PoseArray:geometry_msgs/Vector3:geometry_msgs/Pose:std_msgs/Header:std_msgs/Float64:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv" NAME_WE)
add_custom_target(_j2n6s300_ml_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "j2n6s300_ml" "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv" "geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/PoseArray"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/j2n6s300_ml
)

### Generating Services
_generate_srv_cpp(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/j2n6s300_ml
)

### Generating Module File
_generate_module_cpp(j2n6s300_ml
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/j2n6s300_ml
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(j2n6s300_ml_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(j2n6s300_ml_generate_messages j2n6s300_ml_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_cpp _j2n6s300_ml_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_cpp _j2n6s300_ml_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(j2n6s300_ml_gencpp)
add_dependencies(j2n6s300_ml_gencpp j2n6s300_ml_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS j2n6s300_ml_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/j2n6s300_ml
)

### Generating Services
_generate_srv_eus(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/j2n6s300_ml
)

### Generating Module File
_generate_module_eus(j2n6s300_ml
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/j2n6s300_ml
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(j2n6s300_ml_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(j2n6s300_ml_generate_messages j2n6s300_ml_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_eus _j2n6s300_ml_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_eus _j2n6s300_ml_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(j2n6s300_ml_geneus)
add_dependencies(j2n6s300_ml_geneus j2n6s300_ml_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS j2n6s300_ml_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/j2n6s300_ml
)

### Generating Services
_generate_srv_lisp(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/j2n6s300_ml
)

### Generating Module File
_generate_module_lisp(j2n6s300_ml
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/j2n6s300_ml
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(j2n6s300_ml_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(j2n6s300_ml_generate_messages j2n6s300_ml_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_lisp _j2n6s300_ml_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_lisp _j2n6s300_ml_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(j2n6s300_ml_genlisp)
add_dependencies(j2n6s300_ml_genlisp j2n6s300_ml_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS j2n6s300_ml_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/j2n6s300_ml
)

### Generating Services
_generate_srv_nodejs(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/j2n6s300_ml
)

### Generating Module File
_generate_module_nodejs(j2n6s300_ml
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/j2n6s300_ml
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(j2n6s300_ml_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(j2n6s300_ml_generate_messages j2n6s300_ml_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_nodejs _j2n6s300_ml_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_nodejs _j2n6s300_ml_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(j2n6s300_ml_gennodejs)
add_dependencies(j2n6s300_ml_gennodejs j2n6s300_ml_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS j2n6s300_ml_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/j2n6s300_ml
)

### Generating Services
_generate_srv_py(j2n6s300_ml
  "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/j2n6s300_ml
)

### Generating Module File
_generate_module_py(j2n6s300_ml
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/j2n6s300_ml
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(j2n6s300_ml_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(j2n6s300_ml_generate_messages j2n6s300_ml_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/msg/JointOdom.msg" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_py _j2n6s300_ml_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/simon/sim2real/simulations/kinova/src/sim2Real_j2n6s300/srv/tfQuery.srv" NAME_WE)
add_dependencies(j2n6s300_ml_generate_messages_py _j2n6s300_ml_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(j2n6s300_ml_genpy)
add_dependencies(j2n6s300_ml_genpy j2n6s300_ml_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS j2n6s300_ml_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/j2n6s300_ml)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/j2n6s300_ml
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(j2n6s300_ml_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(j2n6s300_ml_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/j2n6s300_ml)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/j2n6s300_ml
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(j2n6s300_ml_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(j2n6s300_ml_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/j2n6s300_ml)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/j2n6s300_ml
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(j2n6s300_ml_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(j2n6s300_ml_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/j2n6s300_ml)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/j2n6s300_ml
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(j2n6s300_ml_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(j2n6s300_ml_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/j2n6s300_ml)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/j2n6s300_ml\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/j2n6s300_ml
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(j2n6s300_ml_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(j2n6s300_ml_generate_messages_py geometry_msgs_generate_messages_py)
endif()
