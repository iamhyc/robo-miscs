# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "serial_comm: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iserial_comm:/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(serial_comm_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg" NAME_WE)
add_custom_target(_serial_comm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_comm" "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg" ""
)

get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg" NAME_WE)
add_custom_target(_serial_comm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_comm" "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg" ""
)

get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg" NAME_WE)
add_custom_target(_serial_comm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_comm" "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_comm
)
_generate_msg_cpp(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_comm
)
_generate_msg_cpp(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_comm
)

### Generating Services

### Generating Module File
_generate_module_cpp(serial_comm
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_comm
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(serial_comm_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(serial_comm_generate_messages serial_comm_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_cpp _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_cpp _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_cpp _serial_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_comm_gencpp)
add_dependencies(serial_comm_gencpp serial_comm_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_comm_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_comm
)
_generate_msg_eus(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_comm
)
_generate_msg_eus(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_comm
)

### Generating Services

### Generating Module File
_generate_module_eus(serial_comm
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_comm
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(serial_comm_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(serial_comm_generate_messages serial_comm_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_eus _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_eus _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_eus _serial_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_comm_geneus)
add_dependencies(serial_comm_geneus serial_comm_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_comm_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_comm
)
_generate_msg_lisp(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_comm
)
_generate_msg_lisp(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_comm
)

### Generating Services

### Generating Module File
_generate_module_lisp(serial_comm
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_comm
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(serial_comm_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(serial_comm_generate_messages serial_comm_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_lisp _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_lisp _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_lisp _serial_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_comm_genlisp)
add_dependencies(serial_comm_genlisp serial_comm_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_comm_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_comm
)
_generate_msg_nodejs(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_comm
)
_generate_msg_nodejs(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_comm
)

### Generating Services

### Generating Module File
_generate_module_nodejs(serial_comm
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_comm
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(serial_comm_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(serial_comm_generate_messages serial_comm_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_nodejs _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_nodejs _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_nodejs _serial_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_comm_gennodejs)
add_dependencies(serial_comm_gennodejs serial_comm_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_comm_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_comm
)
_generate_msg_py(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_comm
)
_generate_msg_py(serial_comm
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_comm
)

### Generating Services

### Generating Module File
_generate_module_py(serial_comm
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_comm
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(serial_comm_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(serial_comm_generate_messages serial_comm_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/serial_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_py _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/pan_data.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_py _serial_comm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/serial_comm/msg/car_speed.msg" NAME_WE)
add_dependencies(serial_comm_generate_messages_py _serial_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_comm_genpy)
add_dependencies(serial_comm_genpy serial_comm_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_comm_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_comm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_comm
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(serial_comm_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_comm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_comm
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(serial_comm_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_comm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_comm
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(serial_comm_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_comm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_comm
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(serial_comm_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_comm)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_comm\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_comm
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(serial_comm_generate_messages_py geometry_msgs_generate_messages_py)
endif()
