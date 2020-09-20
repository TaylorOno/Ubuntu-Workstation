# Don't stop if docker fails
set +e

# Docker
# sudo apt install -y docker.io
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

sudo curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker
sudo curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -o /etc/bash_completion.d/docker-machine
sudo groupadd docker
sudo usermod -aG docker ${USER}

set -e
