#!/bin/bash

#PYTORCH INSTALLATION

function Help
{
   # Displays Help
   echo "This script install PyTorch to CUDA 11.6." 
   echo
   echo "Syntax: pytorch.sh [-p|h]"
   echo "Options:"
   echo "-h     Help function"
   echo "-p     Python version that will be installed"
   echo
   echo "EXAMPLE:"
   echo "bash pytorch.sh -h      (Help function)"
   echo "bash pytorch.sh -p 3.8  (Install PyTorch in Python3.8)"
   echo "bash pytorch.sh         (Install PyTorch in Python3)"
   echo
}

#Take the flags
while getopts "hp:" flag
do
    case "${flag}" in
        h) 
         Help
         exit
        ;;
        p) version=${OPTARG};;
        \?)
         echo "Error: Invalid option"
         exit
         ;;
    esac
done
if [[ $version -eq 0 ]]
then
    echo "INSTALLING PYTORCH TO CUDA 11.6 WITH pip3 ..."
    echo
    pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
else
    echo "INSTALLING PYTORCH TO CUDA 11.6 WITH python$version -m pip ..."
    echo
    python$version -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
fi