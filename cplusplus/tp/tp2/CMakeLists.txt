cmake_minimum_required(VERSION 3.6)
project(tp2)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.cpp Stock.cpp Stock.h visu.cpp visu.h Com.cpp Com.h Com1.cpp Com1.h)
add_executable(tp2 ${SOURCE_FILES})