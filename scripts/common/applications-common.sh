# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

sudo apt install -y ruby

# Utilities
sudo snap install postman

# Browsers
sudo snap install chromium

# Communication
sudo snap install slack --classic

# Text Editors
sudo snap install code --classic

set -e
