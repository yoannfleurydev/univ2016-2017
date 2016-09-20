cmake_minimum_required(VERSION 3.6)
project(tp1)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.cpp intf.cpp intf.h main2.cpp op.cpp op.h tb.cpp tb.h main3.cpp)
add_executable(tp1 ${SOURCE_FILES})