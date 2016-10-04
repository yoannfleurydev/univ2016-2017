cmake_minimum_required(VERSION 3.6)
project(tp3)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.cpp Employee.cpp Employee.h Society.cpp Society.h Hiring.cpp Hiring.h TempWorker.cpp TempWorker.h)
add_executable(tp3 ${SOURCE_FILES})