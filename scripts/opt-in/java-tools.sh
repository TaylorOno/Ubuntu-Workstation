echo
echo "Installing Java Development tools"
sudo apt install -y maven
sudo apt install -y gradle
sudo apt install -y gradle-completion

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=intellij
popd
