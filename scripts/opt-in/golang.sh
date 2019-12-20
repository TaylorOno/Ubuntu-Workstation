echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src

wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
sudo tar -xvf go1.13.5.linux-amd64.tar.gz -C /usr/local
sudo ln -sfn /usr/local/go/bin/go /usr/bin/go
sudo ln -sfn /usr/local/go/bin/gofmt /usr/bin/gofmt
sudo rm go1.13.5.linux-amd64.tar.gz

sudo snap install goland

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=goland
popd
