#!/bin/bash

#PYTHON INSTALLATION

function Help
{
   # Displays Help
   echo "This script install the Python version needed" 
   echo
   echo "Syntax: python_install.sh [-v|h]"
   echo "Options:"
   echo "-h     Help function"
   echo "-v     Select the Python version that will be installed."
   echo "       If don't pass the Python version, will be installed the 3.9 version."
   echo
   echo "EXAMPLE:"
   echo "bash python_install.sh -h      (Help function)"
   echo "bash python_install.sh -v 3.8  (Install Python 3.8)"
   echo "bash python_install.sh         (Install Python 3.9)"
   echo
}

#Take the flags
while getopts "hv:" flag
do
    case "${flag}" in
        h) 
         Help
         exit
        ;;
        v) version=${OPTARG};;
        \?)
         echo "Error: Invalid option"
         exit
         ;;
    esac
done

#Execute the installation
if [[ $version -eq 0 ]]
then
    echo "Installing Python 3.9"
    sudo apt install python3.9
    python3.9 -m pip install --upgrade pip
    python3.9 -m pip install scikit-build
    python3.9 -m pip install cython
    python3.9 --version
else
    echo "Installing Python $version"
    sudo apt install python$version
    python$version -m pip install --upgrade pip
    python$version -m pip install scikit-build
    python$version -m pip install cython
    python$version --version
fi