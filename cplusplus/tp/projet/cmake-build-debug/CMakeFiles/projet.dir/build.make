# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

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
CMAKE_COMMAND = /home/valentin/clion-2016.3.2/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/valentin/clion-2016.3.2/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/valentin/dev/univ2016-2017/cplusplus/tp/projet

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/projet.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/projet.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/projet.dir/flags.make

CMakeFiles/projet.dir/main2.cpp.o: CMakeFiles/projet.dir/flags.make
CMakeFiles/projet.dir/main2.cpp.o: ../main2.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/projet.dir/main2.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projet.dir/main2.cpp.o -c /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/main2.cpp

CMakeFiles/projet.dir/main2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projet.dir/main2.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/main2.cpp > CMakeFiles/projet.dir/main2.cpp.i

CMakeFiles/projet.dir/main2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projet.dir/main2.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/main2.cpp -o CMakeFiles/projet.dir/main2.cpp.s

CMakeFiles/projet.dir/main2.cpp.o.requires:

.PHONY : CMakeFiles/projet.dir/main2.cpp.o.requires

CMakeFiles/projet.dir/main2.cpp.o.provides: CMakeFiles/projet.dir/main2.cpp.o.requires
	$(MAKE) -f CMakeFiles/projet.dir/build.make CMakeFiles/projet.dir/main2.cpp.o.provides.build
.PHONY : CMakeFiles/projet.dir/main2.cpp.o.provides

CMakeFiles/projet.dir/main2.cpp.o.provides.build: CMakeFiles/projet.dir/main2.cpp.o


CMakeFiles/projet.dir/Ressources.cpp.o: CMakeFiles/projet.dir/flags.make
CMakeFiles/projet.dir/Ressources.cpp.o: ../Ressources.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/projet.dir/Ressources.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/projet.dir/Ressources.cpp.o -c /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/Ressources.cpp

CMakeFiles/projet.dir/Ressources.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/projet.dir/Ressources.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/Ressources.cpp > CMakeFiles/projet.dir/Ressources.cpp.i

CMakeFiles/projet.dir/Ressources.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/projet.dir/Ressources.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/Ressources.cpp -o CMakeFiles/projet.dir/Ressources.cpp.s

CMakeFiles/projet.dir/Ressources.cpp.o.requires:

.PHONY : CMakeFiles/projet.dir/Ressources.cpp.o.requires

CMakeFiles/projet.dir/Ressources.cpp.o.provides: CMakeFiles/projet.dir/Ressources.cpp.o.requires
	$(MAKE) -f CMakeFiles/projet.dir/build.make CMakeFiles/projet.dir/Ressources.cpp.o.provides.build
.PHONY : CMakeFiles/projet.dir/Ressources.cpp.o.provides

CMakeFiles/projet.dir/Ressources.cpp.o.provides.build: CMakeFiles/projet.dir/Ressources.cpp.o


# Object files for target projet
projet_OBJECTS = \
"CMakeFiles/projet.dir/main2.cpp.o" \
"CMakeFiles/projet.dir/Ressources.cpp.o"

# External object files for target projet
projet_EXTERNAL_OBJECTS =

projet: CMakeFiles/projet.dir/main2.cpp.o
projet: CMakeFiles/projet.dir/Ressources.cpp.o
projet: CMakeFiles/projet.dir/build.make
projet: CMakeFiles/projet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable projet"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/projet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/projet.dir/build: projet

.PHONY : CMakeFiles/projet.dir/build

CMakeFiles/projet.dir/requires: CMakeFiles/projet.dir/main2.cpp.o.requires
CMakeFiles/projet.dir/requires: CMakeFiles/projet.dir/Ressources.cpp.o.requires

.PHONY : CMakeFiles/projet.dir/requires

CMakeFiles/projet.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/projet.dir/cmake_clean.cmake
.PHONY : CMakeFiles/projet.dir/clean

CMakeFiles/projet.dir/depend:
	cd /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/valentin/dev/univ2016-2017/cplusplus/tp/projet /home/valentin/dev/univ2016-2017/cplusplus/tp/projet /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug /home/valentin/dev/univ2016-2017/cplusplus/tp/projet/cmake-build-debug/CMakeFiles/projet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/projet.dir/depend

