#!/bin/bash

# Docker Compose Installation

function check_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root"
        exit
    fi
}

check_sudo()

function docker_compose_installation() {
    echo "Installing Docker Compose"

    COMPOSE_VERSION="v2.17.2"
    sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version

    echo "Docker Compose Installed Successfully"
}

docker_compose_installation()