#!/bin/bash

#ROS MELODIC INSTALLATION

function Help
{
   # Displays Help
   echo "This script install ROS Melodic." 
   echo "The S.O. must be a Ubuntu 18.04."
   echo
   echo "Syntax: ros.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash ros.sh -h   (Help function)"
   echo "bash ros.sh      (Install ROS Melodic)"
   echo
}

function main
{
    echo "INSTALLING ROS MELODIC"
    echo
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt install curl
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    sudo apt update
    sudo apt install ros-melodic-desktop-full
    echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
    source ~/.bashrc
    sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
    sudo apt install python-rosdep
    sudo rosdep init
    rosdep update
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

main