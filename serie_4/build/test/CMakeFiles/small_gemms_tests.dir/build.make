# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

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
CMAKE_SOURCE_DIR = /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build

# Include any dependencies generated for this target.
include test/CMakeFiles/small_gemms_tests.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/small_gemms_tests.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/small_gemms_tests.dir/flags.make

test/CMakeFiles/small_gemms_tests.dir/main.cpp.o: test/CMakeFiles/small_gemms_tests.dir/flags.make
test/CMakeFiles/small_gemms_tests.dir/main.cpp.o: ../test/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/small_gemms_tests.dir/main.cpp.o"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/small_gemms_tests.dir/main.cpp.o -c /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/test/main.cpp

test/CMakeFiles/small_gemms_tests.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/small_gemms_tests.dir/main.cpp.i"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/test/main.cpp > CMakeFiles/small_gemms_tests.dir/main.cpp.i

test/CMakeFiles/small_gemms_tests.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/small_gemms_tests.dir/main.cpp.s"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/test/main.cpp -o CMakeFiles/small_gemms_tests.dir/main.cpp.s

test/CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.o: test/CMakeFiles/small_gemms_tests.dir/flags.make
test/CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.o: ../test/small_gemms_tests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object test/CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.o"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.o -c /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/test/small_gemms_tests.cpp

test/CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.i"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/test/small_gemms_tests.cpp > CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.i

test/CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.s"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/test/small_gemms_tests.cpp -o CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.s

# Object files for target small_gemms_tests
small_gemms_tests_OBJECTS = \
"CMakeFiles/small_gemms_tests.dir/main.cpp.o" \
"CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.o"

# External object files for target small_gemms_tests
small_gemms_tests_EXTERNAL_OBJECTS =

test/small_gemms_tests: test/CMakeFiles/small_gemms_tests.dir/main.cpp.o
test/small_gemms_tests: test/CMakeFiles/small_gemms_tests.dir/small_gemms_tests.cpp.o
test/small_gemms_tests: test/CMakeFiles/small_gemms_tests.dir/build.make
test/small_gemms_tests: small_gemms/libsmall_gemms_lib.a
test/small_gemms_tests: test/CMakeFiles/small_gemms_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable small_gemms_tests"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/small_gemms_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/small_gemms_tests.dir/build: test/small_gemms_tests

.PHONY : test/CMakeFiles/small_gemms_tests.dir/build

test/CMakeFiles/small_gemms_tests.dir/clean:
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test && $(CMAKE_COMMAND) -P CMakeFiles/small_gemms_tests.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/small_gemms_tests.dir/clean

test/CMakeFiles/small_gemms_tests.dir/depend:
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4 /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/test /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/test/CMakeFiles/small_gemms_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/small_gemms_tests.dir/depend

