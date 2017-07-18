cmake_minimum_required(VERSION 2.8.8)
add_definitions(-std=c++11)
find_package(OpenCV)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(two_camera_test main.cpp)
target_link_libraries(two_camera_test ${OpenCV_LIBRARIES})
