# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "console: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iconsole:/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(console_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg" NAME_WE)
add_custom_target(_console_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "console" "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(console
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/console
)

### Generating Services

### Generating Module File
_generate_module_cpp(console
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/console
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(console_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(console_generate_messages console_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg" NAME_WE)
add_dependencies(console_generate_messages_cpp _console_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(console_gencpp)
add_dependencies(console_gencpp console_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS console_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(console
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/console
)

### Generating Services

### Generating Module File
_generate_module_eus(console
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/console
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(console_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(console_generate_messages console_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg" NAME_WE)
add_dependencies(console_generate_messages_eus _console_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(console_geneus)
add_dependencies(console_geneus console_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS console_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(console
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/console
)

### Generating Services

### Generating Module File
_generate_module_lisp(console
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/console
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(console_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(console_generate_messages console_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg" NAME_WE)
add_dependencies(console_generate_messages_lisp _console_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(console_genlisp)
add_dependencies(console_genlisp console_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS console_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(console
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/console
)

### Generating Services

### Generating Module File
_generate_module_nodejs(console
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/console
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(console_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(console_generate_messages console_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg" NAME_WE)
add_dependencies(console_generate_messages_nodejs _console_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(console_gennodejs)
add_dependencies(console_gennodejs console_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS console_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(console
  "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/console
)

### Generating Services

### Generating Module File
_generate_module_py(console
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/console
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(console_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(console_generate_messages console_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/team5/Desktop/robo-miscs/RM_ROS/auto_car/src/console/msg/serial_data.msg" NAME_WE)
add_dependencies(console_generate_messages_py _console_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(console_genpy)
add_dependencies(console_genpy console_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS console_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/console)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/console
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(console_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(console_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/console)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/console
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(console_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(console_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/console)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/console
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(console_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(console_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/console)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/console
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(console_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(console_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/console)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/console\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/console
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(console_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(console_generate_messages_py geometry_msgs_generate_messages_py)
endif()
