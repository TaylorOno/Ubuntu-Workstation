#!/usr/bin/env bash

SONAR_VERS=$(curl -s -X GET  https://api.github.com/repos/Sonarsource/sonar-scanner-cli/tags | jq -r .[0].name)
wget -O sonar-scanner-cli.zip "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_VERS}-linux.zip"
sudo unzip -oq sonar-scanner-cli.zip -d /opt
sudo ln -sfn /opt/sonar-scanner-"$SONAR_VERS"-linux/bin/sonar-scanner /usr/local/sbin/sonar-scanner
sudo rm -rf sonar-scanner-cli.zip