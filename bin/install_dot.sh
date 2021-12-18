#!/bin/bash

: '
    dot.sh

    A shell script designed to setup the dotfiles on any system.
    The following operations are performed:
        1. Clone dotfiles repository
        2. Move all dotfiles to ~
        3. Delete dotfiles repository
        4. Install necessary packages
        5. Delete self
'

    ## Instance Variables ##

debug=0
base_dir=~

    ## Initial Commands ##  

# Makes it possible to move dotfiles using *
shopt -s dotglob

# Sets install to ~/test if in debug
if [[ ${debug} == 1 ]]; then
    base_dir=~/test
    echo ${debug}

    # Makes a test directory if in debug
    if [[ -e ~/test ]]; then
        rm -rf ~/test
    fi
    mkdir ~/test
else
    echo ye
fi

    ## Helper Functions ##

# Checks whether the current OS is the argument
isOS() {
    echo $(hostnamectl | grep -c "$1") 
}

    ## Main Script ##

# Clones repository
git clone "https://github.com/esgameco/dotfiles"

# Moves all dotfiles to ~
mv ./dotfiles/* ${base_dir}

# Deletes dotfiles repository
rm -r ./dotfiles

# Install Packages
source ~/bin/installs/installs.sh

# Install FZF
if [[ ! -e ${base_dir}/.fzf ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ${base_dir}/.fzf
    yes | ${base_dir}/.fzf/install
fi

# Install Nodejs
if [[ $(isOS ubuntu) ]]; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
elif [[ $(isOS arch) ]]; then
    curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
fi
