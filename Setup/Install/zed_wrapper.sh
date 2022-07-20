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
   echo "bash zed_wrapper.sh -h   (Help function)"
   echo "bash zed_wrapper.sh      (Install Zed Wrapper ROS package)"
   echo
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

echo "INSTALLING ZED WRAPPER ROS PACKAGE"
echo
cd ~/catkin_ws/src/
git clone --recursive https://github.com/stereolabs/zed-ros-wrapper.git
cd ..
rosdep install --from-paths src --ignore-src -r -y
catkin_make -DCMAKE_BUILD_TYPE=Release
source ./devel/setup.bash
