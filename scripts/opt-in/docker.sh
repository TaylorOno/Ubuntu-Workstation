#!/usr/bin/env bash

if command -v docker 2>&1 >/dev/null; then
  echo " - Docker is already installed"
else
  set +e
  # Add Docker's official GPG key:
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod 644 /etc/apt/keyrings/docker.asc
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt-get -qq update >/dev/null

  sudo apt-get -qq install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >/dev/null

  # Add user to docker group
  sudo groupadd docker
  sudo usermod -aG docker ${USER}

  echo " - Installed the latest version of docker"
  set -e
fi
