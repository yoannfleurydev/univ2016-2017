cmake_minimum_required(VERSION 3.6)
project(projet)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp Ressources.cpp Ressources.h)
add_executable(projet ${SOURCE_FILES})