#!/usr/bin/env bash
#
# setup.sh:  run the Pivotal workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur
set -e

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"

# Update Ubuntu Package Catalog
echo "-----------------------------------------"
echo "Updating Package Catalog"
echo "-----------------------------------------"
sudo apt-get clean && sudo apt-get -qq -o Acquire::ForceIPv4=false update -y && sudo apt-get -qq upgrade -y

echo
echo "-----------------------------------------"
echo "Common Dependencies"
echo "-----------------------------------------"
sudo apt-get -qq install -y build-essential ca-certificates apt-transport-https curl software-properties-common >/dev/null
source "${MY_DIR}"/scripts/common/configuration-bash.sh
source "${MY_DIR}"/scripts/common/git.sh
source "${MY_DIR}"/scripts/common/git-aliases.sh

source ${MY_DIR}/scripts/common/applications-common.sh
source ${MY_DIR}/scripts/common/unix.sh
source ${MY_DIR}/scripts/common/sonar-scanner.sh
source ${MY_DIR}/scripts/common/configurations.sh

echo
echo "-----------------------------------------"
echo "Optional Dependencies"
echo "-----------------------------------------"
# For each command line argument, try executing the corresponding script in opt-in/
for var in "$@"
do
    FILE=${MY_DIR}/scripts/opt-in/${var}.sh
    echo "Installing $var: $FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
    echo
done

source ${MY_DIR}/scripts/common/finished.sh
