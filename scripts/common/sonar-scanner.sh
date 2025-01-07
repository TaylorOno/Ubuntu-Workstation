#!/usr/bin/env bash

echo
echo "Installing Sonar Scanner CLI"

SONAR_VERSION=$(ls /opt/ | grep sonar)
SONAR_LATEST=$(curl -s -X GET  https://api.github.com/repos/Sonarsource/sonar-scanner-cli/tags | jq -r .[0].name)

if [[ "$SONAR_VERSION" == "sonar-scanner-$SONAR_LATEST-linux-x64" ]]; then
  echo "Latest sonar-scanner-cli version $SONAR_LATEST is already installed"
else
  wget -O sonar-scanner-cli.zip "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_LATEST-linux-x64.zip"
  sudo unzip -oq sonar-scanner-cli.zip -d /opt
  sudo ln -sfn /opt/sonar-scanner-"$SONAR_LATEST"-linux-x64/bin/sonar-scanner /usr/local/bin/sonar-scanner
  sudo rm -rf sonar-scanner-cli.zip
  echo "Installed sonar-scanner-cli"
fi
