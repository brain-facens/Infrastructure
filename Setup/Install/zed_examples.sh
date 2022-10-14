#!/bin/bash

#ZED EXAMPLES INSTALLATION

function Help
{
   # Displays Help
   echo "This script install Zed Examples ROS package." 
   echo
   echo "Syntax: zed_examples.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash zed_examples.sh -h           (Help function)"
   echo "bash zed_examples.sh ~/catkin_ws/ (Install Zed Examples ROS package)"
   echo
}

function main
{
    echo "INSTALLING ZED EXAMPLES ROS PACKAGE"
    echo
    cd $1src/
    git clone https://github.com/stereolabs/zed-ros-examples.git
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