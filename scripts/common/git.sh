echo
echo "Installing Git and associated tools"
wget https://github.com/git-duet/git-duet/releases/latest/download/linux_amd64.tar.gz
sudo tar -xvf linux_amd64.tar.gz -C /usr/local/bin
rm linux_amd64.tar.gz

sudo apt-get install -y vim

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/local/bin/vim
git config --global transfer.fsckobjects true

HOOKS_DIRECTORY=$HOME/workspace/git-hooks-core
if [ ! -d $HOOKS_DIRECTORY ]; then
  echo
  echo "Installing git hooks for cred-alert"
  # for more information see https://github.com/pivotal-cf/git-hooks-core
  git clone https://github.com/pivotal-cf/git-hooks-core $HOOKS_DIRECTORY
  git config --global --add core.hooksPath $HOOKS_DIRECTORY
else
  echo
  echo "Updating git-hooks for cred-alert"
  pushd $HOOKS_DIRECTORY
  git pull -r
  popd
fi

# install cred-alert-cli
os_name=$(uname | awk '{print tolower($1)}')
curl -O https://s3.amazonaws.com/cred-alert/cli/current-release/cred-alert-cli_${os_name}
sudo install cred-alert-cli_linux /usr/local/bin/cred-alert-cli
rm cred-alert-cli_${os_name}
