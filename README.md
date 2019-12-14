# Workstation Setup

This project automates the process of setting up a new Ubuntu Development machine using a simple [Bash](https://www.gnu.org/software/bash/) script.  This is a fork of the [Pivotal Workstation](https://github.com/pivotal/workstation-setup) repository tailored to ubuntu workstations.

## Goals

The primary goal of this project is to give people a simple script they can run to make their machine a bit more useful and standard for working on Software projects.

 * A bash script is easy for users to edit locally on-the-fly for small temporary tweaks
 * Everything is in one repository
 * The project name is informative
 * Keep it easy to fork and customize
 * It has very limited requirements: git, bash and Ruby are all available on macOS by default

## Anti-goals

This project does not aim to do everything. Some examples:

 * We don't install everything that your project needs. These scripts should only install generally useful things, and prefer running quickly over being complete.
 * We avoid setting up and maintaining overly-custom configurations. When there is already a tool that will get us something in a conventional manner, such as [bash-it](https://github.com/Bash-it/bash-it), we prefer to use it instead of doing things ourselves.

**Warning: the automation script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

## Getting Started

Open up Terminal and run the following commands:

```sh
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/TaylorOno/Ubuntu-Workstation.git
cd workstation-setup
```

### Engineering Machine

If you're setting up an engineering machine choose which languages to install:

```sh
# For Labs developers (remove unnecessary languages when running command)
./setup.sh java ruby node golang python c docker

# For Data developers
./setup.sh c golang java docker

# For .net
./setup.sh dotnet
```

The list of Engineering applications is found in: [applications-common.sh](https://github.com/TaylorOno/workstation-setup/blob/master/scripts/common/applications-common.sh)

### Designer Machine

If you're setting up a design machine run the following:

```sh
./setup.sh designer
```

In addition to the Engineering applications, this script also installs the list of Design applications found in: [applications-designer.sh](https://github.com/TaylorOno/workstation-setup/blob/master/scripts/opt-in/designer.sh)

### XP Workshop

If you're setting up a machine for the XP workshop run the following:

```sh
./setup.sh java node
```

## Customizing

If you'd like to customize this project for a project's use:

- Fork the project
- Edit the shells scripts to your liking
- Profit
