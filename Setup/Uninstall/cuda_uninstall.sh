#!/bin/bash

#UNINSTALLING CUDA

function Help
{
   # Displays Help
   echo "This script uninstall any CUDA version." 
   echo
   echo "Syntax: cuda_uninstall.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash cuda_uninstall.sh -h   (Help function)"
   echo "bash cuda_uninstall.sh      (Uninstall CUDA)"
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

echo "Uninstalling CUDA"
echo
sudo apt-get --purge remove cuda
sudo apt-get remove --auto-remove nvidia-cuda-toolkit
sudo apt-get purge nvidia-cuda-toolkit
echo
echo "Test"
nvidia-smi #testing
