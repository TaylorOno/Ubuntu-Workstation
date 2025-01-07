#!/usr/bin/env bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if ! command -v nvm &> /dev/null; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash >/dev/null
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  echo " - Installed Node Version Manager (nvm)"
else
  echo " - NVM is already installed"
fi

if ! command -v node &> /dev/null; then
  nvm install --silent node
  echo " - Installed the latest version of NodeJS"
else
  echo " - NodeJS is already installed"
fi

if ! command -v deno &> /dev/null; then
  curl -fsSL https://deno.land/install.sh | sh -s -- -y >/dev/null
  source ~/.bashrc
  echo " - Installed Deno"
else
  echo " - Deno is already installed"
fi