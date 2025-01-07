#!/usr/bin/env bash

if command -v kubectl 2>&1 >/dev/null; then
  echo " - kubectl is already installed"
else
  set +e
  # Add Kubernetes official GPG key:
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring
  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly
  sudo apt-get -qq update

  # Install Kubectl
  sudo apt-get -qq install -y kubectl

  # Shell completion
  FILE=~/.bashrc
  if [[ ! -f "$FILE" ]]; then
      touch $FILE
  fi

  echo 'source <(kubectl completion bash)' >>~/.bashrc
  echo 'alias k=kubectl' >>~/.bashrc
  echo 'complete -F __start_kubectl k' >>~/.bashrc

  echo " - Installed the latest version of kubectl"
  set -e
fi