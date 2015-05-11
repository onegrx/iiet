cmake_minimum_required(VERSION 3.2)
project(skiplist)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.cpp)
add_executable(skiplist ${SOURCE_FILES} SkipList.cpp SkipList.h SKLNode.cpp SKLNode.h)