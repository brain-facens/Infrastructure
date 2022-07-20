#!/bin/bash

#APPS INSTALLATION

function Help
{
   # Displays Help
   echo "This script install GIT, CURL, GPARTED, HTOP, ZOOM, DISCOD, VSCODE." 
   echo
   echo "Syntax: apps.sh [-r|h]"
   echo "Options:"
   echo "-h     Help function"
   echo "-r     Reboot the computer after the installations"
   echo
   echo "EXAMPLE:"
   echo "bash apps.sh -h   (Help function)"
   echo "bash apps.sh -r   (Install the apps and reboot after)"
   echo "bash apps.sh      (Install the apps without reboot)"
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
        r) rbt=${OPTARG};;
        \?)
         echo "Error: Invalid option"
         exit
        ;;
    esac
done
    

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

if [["$rbt" = true]]
then
    echo "REBOOTING"
    reboot
fi