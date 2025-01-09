#!/usr/bin/env bash

NVM_DIR="$HOME/.nvm"
if [[ -e "$NVM_DIR" ]]; then
  echo " - NVM is already installed"
else
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash >/dev/null
  echo " - Installed Node Version Manager (nvm)"
fi

if command -v node 2>&1 >/dev/null; then
  echo " - NodeJS is already installed"
else
  source "$NVM_DIR/nvm.sh"
  nvm install node --lts >/dev/null
  echo " - Installed the latest version of NodeJS"
fi

if command -v deno &>/dev/null; then
  echo " - Deno is already installed"
else
  curl -fsSL https://deno.land/install.sh | sh -s -- -y >/dev/null
  echo " - Installed Deno"
fi
