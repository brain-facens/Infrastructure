#!/bin/bash

#SDK INSTALLATION

function Help
{
   # Displays Help
   echo "This script install Zed SDK." 
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

echo "INSTALLING ZED SDK"
echo
cd ~/Downloads
chmod +x ZED_SDK_Ubuntu18_cuda11.5_v3.7.4.run
./ZED_SDK_Ubuntu18_cuda11.5_v3.7.4.run
