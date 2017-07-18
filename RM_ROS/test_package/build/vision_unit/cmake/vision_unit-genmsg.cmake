# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "vision_unit: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ivision_unit:/home/ubuntu/ws/src/vision_unit/msg;-Imove_base_msgs:/opt/ros/kinetic/share/move_base_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(vision_unit_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv" NAME_WE)
add_custom_target(_vision_unit_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_unit" "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv" "geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg" NAME_WE)
add_custom_target(_vision_unit_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_unit" "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg" ""
)

get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg" NAME_WE)
add_custom_target(_vision_unit_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_unit" "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_unit
)
_generate_msg_cpp(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_unit
)

### Generating Services
_generate_srv_cpp(vision_unit
  "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_unit
)

### Generating Module File
_generate_module_cpp(vision_unit
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_unit
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(vision_unit_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(vision_unit_generate_messages vision_unit_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv" NAME_WE)
add_dependencies(vision_unit_generate_messages_cpp _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_cpp _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_cpp _vision_unit_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_unit_gencpp)
add_dependencies(vision_unit_gencpp vision_unit_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_unit_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_unit
)
_generate_msg_eus(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_unit
)

### Generating Services
_generate_srv_eus(vision_unit
  "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_unit
)

### Generating Module File
_generate_module_eus(vision_unit
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_unit
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(vision_unit_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(vision_unit_generate_messages vision_unit_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv" NAME_WE)
add_dependencies(vision_unit_generate_messages_eus _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_eus _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_eus _vision_unit_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_unit_geneus)
add_dependencies(vision_unit_geneus vision_unit_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_unit_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_unit
)
_generate_msg_lisp(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_unit
)

### Generating Services
_generate_srv_lisp(vision_unit
  "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_unit
)

### Generating Module File
_generate_module_lisp(vision_unit
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_unit
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(vision_unit_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(vision_unit_generate_messages vision_unit_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv" NAME_WE)
add_dependencies(vision_unit_generate_messages_lisp _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_lisp _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_lisp _vision_unit_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_unit_genlisp)
add_dependencies(vision_unit_genlisp vision_unit_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_unit_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_unit
)
_generate_msg_nodejs(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_unit
)

### Generating Services
_generate_srv_nodejs(vision_unit
  "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_unit
)

### Generating Module File
_generate_module_nodejs(vision_unit
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_unit
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(vision_unit_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(vision_unit_generate_messages vision_unit_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv" NAME_WE)
add_dependencies(vision_unit_generate_messages_nodejs _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_nodejs _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_nodejs _vision_unit_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_unit_gennodejs)
add_dependencies(vision_unit_gennodejs vision_unit_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_unit_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_unit
)
_generate_msg_py(vision_unit
  "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_unit
)

### Generating Services
_generate_srv_py(vision_unit
  "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_unit
)

### Generating Module File
_generate_module_py(vision_unit
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_unit
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(vision_unit_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(vision_unit_generate_messages vision_unit_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/srv/SetGoal.srv" NAME_WE)
add_dependencies(vision_unit_generate_messages_py _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/armor_msg.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_py _vision_unit_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/ws/src/vision_unit/msg/transformed_scan.msg" NAME_WE)
add_dependencies(vision_unit_generate_messages_py _vision_unit_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_unit_genpy)
add_dependencies(vision_unit_genpy vision_unit_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_unit_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_unit)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_unit
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_cpp)
  add_dependencies(vision_unit_generate_messages_cpp move_base_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(vision_unit_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_unit)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_unit
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_eus)
  add_dependencies(vision_unit_generate_messages_eus move_base_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(vision_unit_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_unit)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_unit
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_lisp)
  add_dependencies(vision_unit_generate_messages_lisp move_base_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(vision_unit_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_unit)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_unit
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_nodejs)
  add_dependencies(vision_unit_generate_messages_nodejs move_base_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(vision_unit_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_unit)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_unit\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_unit
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_py)
  add_dependencies(vision_unit_generate_messages_py move_base_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(vision_unit_generate_messages_py geometry_msgs_generate_messages_py)
endif()
