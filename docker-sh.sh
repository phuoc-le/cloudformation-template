#!/bin/sh

set -eu

# Docker
sudo apt update \
    && sudo apt --yes --no-install-recommends install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
    && sudo apt update \
    && sudo apt --yes --no-install-recommends install docker-ce \
    && sudo systemctl enable docker \
    && sudo groupadd docker \
    && sudo gpasswd -a $USER docker \
    && sudo service docker restart  \
    && printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 3

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose \
    && printf '\nDocker Compose installed successfully\n\n'
sleep 10
sudo chmod 777 /var/run/docker.sock
