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
include small_gemms/CMakeFiles/small_gemms_lib.dir/depend.make

# Include the progress variables for this target.
include small_gemms/CMakeFiles/small_gemms_lib.dir/progress.make

# Include the compile flags for this target's objects.
include small_gemms/CMakeFiles/small_gemms_lib.dir/flags.make

small_gemms/CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.o: small_gemms/CMakeFiles/small_gemms_lib.dir/flags.make
small_gemms/CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.o: ../small_gemms/src/gemm_ref.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object small_gemms/CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.o"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.o -c /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/small_gemms/src/gemm_ref.cpp

small_gemms/CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.i"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/small_gemms/src/gemm_ref.cpp > CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.i

small_gemms/CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.s"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/small_gemms/src/gemm_ref.cpp -o CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.s

# Object files for target small_gemms_lib
small_gemms_lib_OBJECTS = \
"CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.o"

# External object files for target small_gemms_lib
small_gemms_lib_EXTERNAL_OBJECTS =

small_gemms/libsmall_gemms_lib.a: small_gemms/CMakeFiles/small_gemms_lib.dir/src/gemm_ref.cpp.o
small_gemms/libsmall_gemms_lib.a: small_gemms/CMakeFiles/small_gemms_lib.dir/build.make
small_gemms/libsmall_gemms_lib.a: small_gemms/CMakeFiles/small_gemms_lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libsmall_gemms_lib.a"
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms && $(CMAKE_COMMAND) -P CMakeFiles/small_gemms_lib.dir/cmake_clean_target.cmake
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/small_gemms_lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
small_gemms/CMakeFiles/small_gemms_lib.dir/build: small_gemms/libsmall_gemms_lib.a

.PHONY : small_gemms/CMakeFiles/small_gemms_lib.dir/build

small_gemms/CMakeFiles/small_gemms_lib.dir/clean:
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms && $(CMAKE_COMMAND) -P CMakeFiles/small_gemms_lib.dir/cmake_clean.cmake
.PHONY : small_gemms/CMakeFiles/small_gemms_lib.dir/clean

small_gemms/CMakeFiles/small_gemms_lib.dir/depend:
	cd /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4 /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/small_gemms /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms /home/hk-project-test-scalfsu/hgf_dgx3529/hpc/serie_4/build/small_gemms/CMakeFiles/small_gemms_lib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : small_gemms/CMakeFiles/small_gemms_lib.dir/depend

