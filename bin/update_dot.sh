#!/bin/bash

: '
    update_dot.sh

    A shell script designed to update already installed.
    The following operations are performed:
        1. Pull git
        2. Install necessary packages
'

    ## Instance Variables ##

debug=0
base_dir=~

    ## Initial Commands ##  

# Makes it possible to move dotfiles using *
shopt -s dotglob

    ## Main Script ##

# Pull git
cd ~
git pull

# Install packages
source ~/bin/installs/installs.sh
