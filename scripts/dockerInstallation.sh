#!/bin/bash

# Docker Installation Script

function check_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root"
        exit
    fi
}

check_sudo()

# Updating System
echo "Updating System"
sudo apt-get update -y >> /dev/null
sudo apt-get upgrade -y >> /dev/null

# Installation Required Packages
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y >> /dev/null

# Adding Docker GPG Key
echo "Adding Docker GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - >> /dev/null

# Adding Docker Repository
echo "Adding Docker Repository"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" >> /dev/null

# Updating System
sudo apt-get update -y >> /dev/null

# Installing Docker
echo "Installing Docker"
sudo apt-get install docker-ce -y >> /dev/null

# Starting Docker
echo "Starting Docker"
sudo systemctl start docker
sudo systemctl enable docker

# Checking Docker Status
echo "Checking Docker Status"
sudo systemctl status docker
sudo usermod -aG docker ${USER}

echo "Docker Installed Successfully"
docker --version