#!/bin/bash

#APPS INSTALLATION

function Help
{
   # Displays Help
   echo "This script install GIT, CURL, GPARTED, HTOP."
   echo
   echo "Syntax: apps.sh [-h][-r REBOOT]"
   echo "Options:"
   echo "-h     Help function"
   echo "-r     Reboot the computer after the installations"
   echo
   echo "EXAMPLE:"
   echo "bash apps.sh -h       (Help function)"
   echo "bash apps.sh -r true  (Install the apps and reboot after)"
   echo "bash apps.sh -r false (Install the apps without reboot)"
   echo "bash apps.sh          (Install the apps without reboot)"
   echo
}

function main
{
    echo "UPDATING"
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
    
    if [[ $1 = true ]]
    then
        echo "REBOOTING"
        reboot
    fi
}

#Take the flags
while getopts "hr:" flag
do
    case "${flag}" in
        h) 
         Help
         exit
        ;;
        r) REBOOT=$2;;
        \?)
         echo "Error: Invalid option"
         exit
        ;;
    esac
done

main $REBOOT