#!/bin/bash

#ZED WRAPPER INSTALLATION 

function Help
{
   # Displays Help
   echo "This script install Zed Wrapper ROS package." 
   echo
   echo "Syntax: zed_wrapper.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash zed_wrapper.sh -h           (Help function)"
   echo "bash zed_wrapper.sh ~/catkin_ws/ (Install Zed Wrapper ROS package)"
   echo
}

function main
{
    echo "INSTALLING ZED WRAPPER ROS PACKAGE"
    echo
    cd $1src/
    git clone --recursive https://github.com/stereolabs/zed-ros-wrapper.git
    cd ..
    rosdep install --from-paths src --ignore-src -r -y
    catkin_make -DCMAKE_BUILD_TYPE=Release
    source ./devel/setup.bash
}

#Take the flags
while getopts "h" flag
do
    case "${flag}" in
        h) 
         Help
         exit
        ;;
        \?)
         echo "Error: Invalid option"
         exit
         ;;
    esac
done

main $1