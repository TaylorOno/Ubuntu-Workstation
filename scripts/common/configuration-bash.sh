echo
echo "Configuring bash with bash-it"
sudo apt-get install -y autojump
sudo apt-get install -y grc #Colorize Logs
sudo apt-get install -y coreutils #Linux Command line tool
cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc
sudo rm -rf ~/.bash_it
export BASH_IT="$HOME/.bash_it"
git clone https://github.com/Bash-it/bash-it.git --depth=1 ~/.bash_it
cp files/add_user_initials_to_git_prompt_info.bash ~/.bash_it/custom
cp files/bobby_pivotal/bobby_pivotal.theme.bash ~/.bash_it/themes/bobby/bobby.theme.bash
cp files/cf_cli.completion.bash ~/.bash_it/completion/available
"$BASH_IT"/install.sh --silent
set +e
source "$BASH_IT"/bash_it.sh
bash-it enable completion git
bash-it enable plugin autojump
bash-it enable plugin ssh
bash-it enable completion ssh
bash-it enable completion cf_cli
set -e

echo
echo "Configuring direnv with bash-it"
sudo  apt-get install -y direnv
cp files/direnv.bash ~/.bash_it/custom/direnv.bash
