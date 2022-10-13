#!/bin/bash

#PYTORCH INSTALLATION

function Help
{
   # Displays Help
   echo "This script install PyTorch to CUDA 11.6." 
   echo
   echo "Syntax: pytorch.sh [-h][-p VERSION]"
   echo "Options:"
   echo "-h     Help function"
   echo "-p     Choose the python version that will be installed"
   echo
   echo "EXAMPLE:"
   echo "bash pytorch.sh -h      (Help function)"
   echo "bash pytorch.sh -p 3.8  (Install PyTorch in Python3.8)"
   echo "bash pytorch.sh         (Install PyTorch with pip)"
   echo
}

function main
{
    if [[ $1 -eq 0 ]]
    then
        echo "INSTALLING PYTORCH TO CUDA 11.6 WITH 'pip'"
        echo
        pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
    else
        echo "INSTALLING PYTORCH TO CUDA 11.6 WITH 'python$1 -m pip'"
        echo
        python$1 -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
    fi
}

#Take the flags
while getopts "hp:" flag
do
    case "${flag}" in
        h) 
         Help
         exit
        ;;
        p) VERSION=$2;;
        \?)
         echo "Error: Invalid option"
         exit
         ;;
    esac
done

main $VERSION