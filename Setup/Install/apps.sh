#!/bin/bash

#CUDA INSTALLATION 11.6

function Help
{
   # Displays Help
   echo "This script install GIT, CURL, GPARTED, HTOP, ZOOM, DISCOD, VSCODE." 
   echo
   echo "Syntax: apps.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash apps.sh -h   (Help function)"
   echo "bash apps.sh      (Install the apps)"
   echo
}

#Take the flags
while getopts "hr:" flag
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

#APPS INSTALLATION

echo "UPDATE"
echo
sudo apt update

echo

echo "INSTALLING GIT"
echo
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

echo

echo "INSTALLING CURL"
echo
sudo apt install curl

echo

echo "INSTALLING GPARTED"
echo
sudo apt install gparted

echo

echo "INSTALLING HTOP"
echo
sudo apt install htop

echo

echo "INSTALLING ZOOM"
echo
cd ~/Downloads/
sudo apt install ./zoom_amd64.deb

echo

echo "INSTALLING DISCORD"
echo
sudo apt install ./discord-0.0.18.deb 

echo

echo "INSTALLING VISUAL STUDIO CODE"
echo
sudo apt install ./code_1.68.1-1655263094_amd64.deb

echo "REBOOTING"
reboot