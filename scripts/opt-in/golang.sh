echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
export GOVERSION=1.14.6

wget https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz
sudo tar -xvf go$GOVERSION.linux-amd64.tar.gz -C /usr/local
sudo ln -sfn /usr/local/go/bin/go /usr/bin/go
sudo ln -sfn /usr/local/go/bin/gofmt /usr/bin/gofmt
sudo rm go$GOVERSION.linux-amd64.tar.gz

sudo snap install goland --classic

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=goland
popd
