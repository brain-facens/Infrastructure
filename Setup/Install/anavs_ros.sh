#!/bin/bash

#ANAVS-ROS-ADAPTE INSTALLATION

function Help
{
   # Displays Help
   echo "This script install Anavs ROS package." 
   echo
   echo "Syntax: anavs_ros.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash anavs_ros.sh -h   (Help function)"
   echo "bash anavs_ros.sh      (Install Anavs ROS package)"
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

echo "INSTALLING ANAVS-ROS-ADAPTE"
echo
cd ~/catkin_ws/src/
git clone https://github.com/brain-facens/anavs-ros-adapter.git
cd ../
rosdep install --from-paths src --ignore-src -r -y
catkin_make
source ./devel/setup.bash
