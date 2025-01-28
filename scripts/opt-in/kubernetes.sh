#!/usr/bin/env bash

if command -v kubectl 2>&1 >/dev/null; then
  echo " - kubectl is already installed"
else
  set +e
  pushd pwd
  # Add Kubernetes official GPG key:
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring
  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly
  sudo apt-get -qq update >/dev/null

  # Install Kubectl
  sudo apt-get -qq install -y kubectl >/dev/null

  # Install Krew
  cd $(mktemp -d)
  OS=$(uname | tr '[:upper:]' '[:lower:]')
  ARCH=$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')
  KREW="krew-${OS}_${ARCH}"
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" && tar zxvf "${KREW}.tar.gz"
  ./"${KREW}" install krew

  # Install Kubecolor
  cd $(mktemp -d)
  VERSION=$(curl -s -X GET https://api.github.com/repos/kubecolor/kubecolor/tags | jq -r .[0].name | sed -e 's/v//')
  KUBECOLOR="kubecolor_${VERSION}_${OS}_${ARCH}"
  curl -fsSLO "https://github.com/kubecolor/kubecolor/releases/latest/download/${KUBECOLOR}.tar.gz" && sudo mkdir -p /usr/local/kubecolor && sudo tar -C /usr/local/kubecolor -xzf "${KUBECOLOR}.tar.gz"
  sudo ln -sfn /usr/local/kubecolor/kubecolor /usr/bin/kubecolor

  # Install Kind
  cd $(mktemp -d)
  VERSION=$(curl -s -X GET https://api.github.com/repos/kubernetes-sigs/kind/releases | jq -r .[0].name | sed -e 's/v//')
  KIND="kind-${OS}-${ARCH}"
  curl -fsSLO "https://kind.sigs.k8s.io/dl/v${VERSION}/${KIND}"
  sudo chmod +x "./${KIND}" && sudo mkdir -p /usr/local/kind && sudo mv "./${KIND}" "/usr/local/kind/${KIND}"
  sudo ln -sfn "/usr/local/kind/${KIND}" /usr/bin/kind

  # Install kubectl plugins
  $HOME/.krew/bin/kubectl-krew install ctx >/dev/null
  $HOME/.krew/bin/kubectl-krew install ns >/dev/null
  $HOME/.krew/bin/kubectl-krew install stern >/dev/null

  # Shell completion
  FILE=~/.bashrc
  if [[ ! -f "$FILE" ]]; then
      touch $FILE
  fi

  mkdir ~/.kube
  kubectl completion bash > ~/.kube/completion.bash.inc
  echo -e '\n# Kubernetes configuration' >>~/.bashrc
  echo 'source "$HOME/.kube/completion.bash.inc"' >>~/.bashrc
  echo 'alias kubectl=kubecolor' >>~/.bashrc
  echo 'alias k=kubectl' >>~/.bashrc

  echo -e '\n# Enable krew' >>~/.bashrc
  echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >>~/.bashrc

  echo " - Installed the latest version of kubectl"

  popd
  set -e
fi