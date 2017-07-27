cmake_minimum_required(VERSION 2.8)
project(detect_car)
find_package( OpenCV REQUIRED )
add_executable( detect_circle detect_circle.cpp )
target_link_libraries( detect_circle ${OpenCV_LIBS} )

add_executable( detect_tape detect_tape.cpp )
target_link_libraries( detect_tape ${OpenCV_LIBS} )

add_executable( calibration calibration.cpp )
target_link_libraries( calibration ${OpenCV_LIBS} )

add_executable( detect_car detect_car.cpp )
target_link_libraries( detect_car ${OpenCV_LIBS} )