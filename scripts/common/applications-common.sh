# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

sudo apt-get -qq install -y ruby

set -e
