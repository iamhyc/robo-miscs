# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/ws/build

# Include any dependencies generated for this target.
include vision_unit/CMakeFiles/armor_detect.dir/depend.make

# Include the progress variables for this target.
include vision_unit/CMakeFiles/armor_detect.dir/progress.make

# Include the compile flags for this target's objects.
include vision_unit/CMakeFiles/armor_detect.dir/flags.make

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o


vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/draw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/draw.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/draw.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/draw.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o


vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/image_utility.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/image_utility.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/image_utility.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/image_utility.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o


vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/main.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/main.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/main.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o


vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/labeler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/labeler.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/labeler.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/labeler.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o


vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect_node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect_node.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect_node.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/armor_detect_node.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o


vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/util.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/util.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/util.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o


vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o: vision_unit/CMakeFiles/armor_detect.dir/flags.make
vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o: /home/ubuntu/ws/src/vision_unit/src/detect_factory/video_recoder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o -c /home/ubuntu/ws/src/vision_unit/src/detect_factory/video_recoder.cpp

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.i"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/ws/src/vision_unit/src/detect_factory/video_recoder.cpp > CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.i

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.s"
	cd /home/ubuntu/ws/build/vision_unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/ws/src/vision_unit/src/detect_factory/video_recoder.cpp -o CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.s

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.requires:

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.requires

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.provides: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.requires
	$(MAKE) -f vision_unit/CMakeFiles/armor_detect.dir/build.make vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.provides.build
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.provides

vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.provides.build: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o


# Object files for target armor_detect
armor_detect_OBJECTS = \
"CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o" \
"CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o" \
"CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o" \
"CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o" \
"CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o" \
"CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o" \
"CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o" \
"CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o"

# External object files for target armor_detect
armor_detect_EXTERNAL_OBJECTS =

/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/build.make
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libtf.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libtf2_ros.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libactionlib.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libmessage_filters.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libroscpp.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_signals.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libtf2.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/librosconsole.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/librostime.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /opt/ros/kinetic/lib/libcpp_common.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_shape.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_stitching.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_superres.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_videostab.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_viz.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_objdetect.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_calib3d.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_features2d.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_flann.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_highgui.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_ml.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_photo.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_video.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_videoio.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_imgcodecs.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_imgproc.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: /usr/local/lib/libopencv_core.so.3.2.0
/home/ubuntu/ws/devel/lib/vision_unit/armor_detect: vision_unit/CMakeFiles/armor_detect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable /home/ubuntu/ws/devel/lib/vision_unit/armor_detect"
	cd /home/ubuntu/ws/build/vision_unit && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/armor_detect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vision_unit/CMakeFiles/armor_detect.dir/build: /home/ubuntu/ws/devel/lib/vision_unit/armor_detect

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/build

vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect.cpp.o.requires
vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/draw.cpp.o.requires
vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/image_utility.cpp.o.requires
vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/main.cpp.o.requires
vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/labeler.cpp.o.requires
vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/armor_detect_node.cpp.o.requires
vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/util.cpp.o.requires
vision_unit/CMakeFiles/armor_detect.dir/requires: vision_unit/CMakeFiles/armor_detect.dir/src/detect_factory/video_recoder.cpp.o.requires

.PHONY : vision_unit/CMakeFiles/armor_detect.dir/requires

vision_unit/CMakeFiles/armor_detect.dir/clean:
	cd /home/ubuntu/ws/build/vision_unit && $(CMAKE_COMMAND) -P CMakeFiles/armor_detect.dir/cmake_clean.cmake
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/clean

vision_unit/CMakeFiles/armor_detect.dir/depend:
	cd /home/ubuntu/ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/ws/src /home/ubuntu/ws/src/vision_unit /home/ubuntu/ws/build /home/ubuntu/ws/build/vision_unit /home/ubuntu/ws/build/vision_unit/CMakeFiles/armor_detect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vision_unit/CMakeFiles/armor_detect.dir/depend

