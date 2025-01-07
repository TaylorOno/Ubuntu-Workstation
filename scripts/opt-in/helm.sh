echo
echo "Installing common helm tooling"

curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get -qq update
sudo apt-get -qq install -y helm

# Shell completion
FILE=~/.bashrc
if [[ -f "$FILE" ]]; then
    echo "$FILE exists proceeding."
else
    echo "$FILE does not exist, creating."
    touch $FILE
fi

echo 'source <(helm completion bash)' >>~/.bashrc