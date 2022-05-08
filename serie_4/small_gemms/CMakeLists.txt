cmake_minimum_required(VERSION 3.9 FATAL_ERROR)
project(small_gemms LANGUAGES CXX)

# search for OpenMP, REQUIRED -> fatal error if not found
find_package(OpenMP REQUIRED)

# add an interface library -> does not generate build output by itself
add_library(small_gemms_lib STATIC include/gemm_ref.h src/gemm_ref.cpp)

target_include_directories(small_gemms_lib PUBLIC include PUBLIC src)

add_executable(small_gemms_driver include/gemm_ref.h src/driver_small_gemms.cpp)
target_link_libraries(small_gemms_driver PUBLIC small_gemms_lib PUBLIC OpenMP::OpenMP_CXX)