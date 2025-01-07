#!/usr/bin/env bash

mkdir -p ~/go/src
export GO_LATEST=$(curl -s -X GET https://go.dev/dl/?mode=json | jq -r .[0].version)

if command -v go &> /dev/null; then
  export GO_VERSION=$(go version | awk '{print $3}')
fi

if [[ "$GO_VERSION" == "$GO_LATEST" ]]; then
    echo " - Latest Go version $GO_LATEST is already installed"
else
  mkdir -p ~/go/src
  wget -q https://dl.google.com/go/$GO_LATEST.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $GO_LATEST.linux-amd64.tar.gz
  sudo ln -sfn /usr/local/go/bin/go /usr/bin/go
  sudo ln -sfn /usr/local/go/bin/gofmt /usr/bin/gofmt
  sudo rm $GO_LATEST.linux-amd64.tar.gz
  echo " - Installed Golang Development tools"
fi
