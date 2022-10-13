#!/bin/bash

#SDK INSTALLATION

function Help
{
   # Displays Help
   echo "This script install Zed SDK 3.7 to Ubuntu 18." 
   echo "This SDK version is compatible with CUDA 11.X (11.0*->11.7)"
   echo
   echo "Syntax: sdk_zed.sh [-h]"
   echo "Options:"  
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash sdk_zed.sh -h   (Help function)"
   echo "bash sdk_zed.sh      (Install Zed SDK)"
   echo
}

function main
{
    echo "INSTALLING ZED SDK 3.7"
    echo
    cd ~/Downloads
    wget https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/3.7/ZED_SDK_Ubuntu18_cuda11.7_v3.7.7.run
    chmod +x ZED_SDK_Ubuntu18_cuda11.7_v3.7.7.run
    ./ZED_SDK_Ubuntu18_cuda11.7_v3.7.7.run
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