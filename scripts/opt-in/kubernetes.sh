echo
echo "Installing common Kubernetes tooling"

sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Shell completion
FILE=~/.bashrc
if [[ -f "$FILE" ]]; then
    echo "$FILE exists proceeding."
else
    echo "$FILE does not exist, creating."
    touch $FILE
fi

echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc


# kubectx
KUBECTX_VER=$(curl -s -X GET  https://api.github.com/repos/ahmetb/kubectx/releases/latest | jq -r .name)
sudo curl -L https://github.com/ahmetb/kubectx/releases/download/"$KUBECTX_VER"/kubectx_"$KUBECTX_VER"_linux_arm64.tar.gz | sudo tar xvz -C /usr/sbin