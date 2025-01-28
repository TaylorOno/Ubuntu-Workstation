#!/usr/bin/env bash

echo
echo "-----------------------------------------"
echo "Installing utilities for unix development"
echo "-----------------------------------------"
set -e

export FZF="$HOME/.fzf"
if [ ! -d $FZF ]; then
  git clone --quiet --depth 1 https://github.com/junegunn/fzf.git $FZF >/dev/null
fi

"$FZF"/install --all >/dev/null
if command -v fzf 2>&1 >/dev/null; then
  echo " - fzf"
else
  echo " - fzf install failed"
fi

sudo apt-get -qq install -y wget >/dev/null
if command -v wget 2>&1 >/dev/null; then
  echo " - wget"
else
  echo " - wget install failed"
fi

sudo apt-get -qq install -y unzip >/dev/null
if command -v unzip 2>&1 >/dev/null; then
  echo " - unzip"
else
  echo " - unzip install failed"
fi

sudo apt-get -qq install -y jq >/dev/null
if command -v jq 2>&1 >/dev/null; then
  echo " - jq"
else
  echo " - jq install failed"
fi

sudo apt-get -qq install -y dnsutils >/dev/null
if command -v nslookup 2>&1 >/dev/null; then
  echo " - dnsutils"
else
  echo " - dnsutils install failed"
fi

set +e