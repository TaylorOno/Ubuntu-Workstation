#!/usr/bin/env bash

if command -v helm 2>&1 >/dev/null; then
  echo " - helm is already installed"
else
  # Add Helm official GPG key
  curl -fsSL https://baltocdn.com/helm/signing.asc | sudo gpg --dearmor -o /etc/apt/keyrings/helm.gpg
  echo "deb [signed-by=/etc/apt/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
  sudo apt-get -qq update >/dev/null

  # Install Helm
  sudo apt-get -qq install -y helm >/dev/null

  # Shell completion
  FILE=~/.bashrc
  if [[ ! -f "$FILE" ]]; then
    touch $FILE
  fi

  echo 'source <(helm completion bash)' >>~/.bashrc

  echo " - Installed the latest version of helm"
fi
