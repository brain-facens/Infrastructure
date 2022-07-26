#!/bin/bash

#DOCKER INSTALLATION

function Help
{
   # Displays Help
   echo "This script install Docker Engine using the repository." 
   echo
   echo "Syntax: docker.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash docker.sh -h   (Help function)"
   echo "bash docker.sh      (Install Docker Engine)"
   echo
}

function main
{
    echo "INSTALLING DOCKER ENGINE"
    echo
    sudo apt-get update
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
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

main