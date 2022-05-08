
cmake_minimum_required(VERSION 3.9 FATAL_ERROR)
project(my-test LANGUAGES CXX)

message(${CMAKE_BUILD_TYPE})

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(small_gemms_tests main.cpp small_gemms_tests.cpp)

target_link_libraries(small_gemms_tests PRIVATE small_gemms_lib PRIVATE catch)