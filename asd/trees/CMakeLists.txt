cmake_minimum_required(VERSION 3.2)
project(trees)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
    Main.cpp)

add_executable(trees ${SOURCE_FILES} BSTNode/BSTNode.cpp BSTNode/BSTNode.h BST/BST.cpp BST/BST.h)