#!/bin/bash

#UNINSTALLING PYTHON

function Help
{
   # Displays Help
   echo "This script uninstall the Python version needed" 
   echo
   echo "Syntax: python_uninstall.sh [-v|h]"
   echo "Options:"
   echo "-h     Help function"
   echo "-v     Select the Python version that will be uninstalled."
   #echo "       If don't pass the Python version, will be uninstalled the 3.9 version."
   echo
   echo "EXAMPLE:"
   echo "bash python_uninstall.sh -h      (Help function)"
   echo "bash python_uninstall.sh -v 3.8  (Uninstall Python 3.8)"
   #echo "bash python_install.sh         (Install Python 3.9)"
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

if [[ $version -ne 3.6 ]]
then
    echo "Uninstalling Python $version"
    sudo apt-get remove --purge python$version
    sudo apt-get remove python$version
    sudo apt-get remove --auto-remove python$version
    sudo apt-get purge python$version
    sudo apt-get purge --auto-remove python$version
    sudo rm -r /usr/local/lib/python$version 
    sudo rm -r /etc/python$version
    echo 
    echo "Test:"
    python$version --version
    ls /usr/local/lib/
else
    echo "You can't uninstall Python3.6 from Ubuntu 18"
    echo "Uninstall Python 3.6 from Ubuntu 18 will crash the Operating System"
fi
