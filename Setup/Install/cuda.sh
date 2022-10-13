#!/bin/bash

#CUDA INSTALLATION 11.6

function Help
{
   # Displays Help
   echo "This script install CUDA 11.6." 
   echo
   echo "Syntax: cuda.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash cuda.sh -h   (Help function)"
   echo "bash cuda.sh      (Install CUDA)"
   echo
}

function main
{
    echo "INSTALLING CUDA 11.6"
    echo
    cd ~
    wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda_11.6.0_510.39.01_linux.run
    sudo sh cuda_11.6.0_510.39.01_linux.run
    echo
    echo "Test"
    nvidia-smi
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