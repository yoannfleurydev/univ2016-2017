cmake_minimum_required(VERSION 3.6)
project(tp4)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.cpp Immeuble.cpp Immeuble.h OutImmeuble.cpp OutImmeuble.h)
add_executable(tp4 ${SOURCE_FILES})