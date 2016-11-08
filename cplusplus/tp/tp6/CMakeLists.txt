cmake_minimum_required(VERSION 3.6)
project(tp6)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.cpp Ressources/Mem.cpp Ressources/Mem.h Ressources/Rep.cpp Ressources/Rep.h)
add_executable(tp6 ${SOURCE_FILES})