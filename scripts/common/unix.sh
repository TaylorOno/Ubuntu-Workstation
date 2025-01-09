#!/usr/bin/env bash

echo
echo "-----------------------------------------"
echo "Installing utilities for unix development"
echo "-----------------------------------------"

export FZF="$HOME/.fzf"
if [ ! -d $FZF ]; then
  git clone --quiet --depth 1 https://github.com/junegunn/fzf.git $FZF >/dev/null
  "$FZF"/install --all >/dev/null
fi
echo " - fzf"

sudo apt-get -qq install -y wget >/dev/null
echo " - wget"

sudo apt-get -qq install -y unzip >/dev/null
echo " - unzip"

sudo apt-get -qq install -y jq >/dev/null
echo " - jq"
