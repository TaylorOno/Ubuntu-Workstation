#!/usr/bin/env bash

echo
echo "-----------------------------------------"
echo "Installing utilities for unix development"
echo "-----------------------------------------"

export FZF="$HOME/.fzf"
if [ ! -d $FZF ]; then
  git clone --quiet --depth 1 https://github.com/junegunn/fzf.git $FZF
  "$FZF"/install --all
  source "$HOME/.bashrc"
fi
echo " - fzf"

sudo apt-get -qq install -y wget
echo " - wget"

sudo apt-get -qq install -y unzip
echo " - unzip"

sudo apt-get -qq install -y jq
echo " - jq"
