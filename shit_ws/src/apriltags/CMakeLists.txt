cmake_minimum_required(VERSION 2.6)
project(apriltags_demo)

find_package(catkin REQUIRED COMPONENTS
roscpp
cv_bridge
image_transport
sensor_msgs
std_msgs
)

include_directories(
  /usr/local/include/eigen3
)

file(GLOB self_LIBRARIES /src/local/lib/*.so)

catkin_package(
CATKIN_DEPENDS)

include_directories (
	${catkin_INCLUDE_DIRS}
	include/
	example/
)
add_executable(apriltags_demo
example/apriltags_demo.cpp
src/Edge.cc
src/FloatImage.cc
src/Gaussian.cc
src/GLine2D.cc
src/GLineSegment2D.cc
src/GrayModel.cc
src/Homography33.cc
src/MathUtil.cc
src/Quad.cc
src/Segment.cc
src/TagDetection.cc
src/TagDetector.cc
src/TagFamily.cc
src/UnionFindSimple.cc
)
target_link_libraries(apriltags_demo ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
