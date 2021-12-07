#!/bin/bash

: '
    update_dot.sh

    A shell script designed to update already installed.
    The following operations are performed:
        1. Clone dotfiles repository
        2. Move all dotfiles to ~
        3. Delete dotfiles repository
        4. Install necessary packages
'

    ## Instance Variables ##

debug=0
base_dir=~

    ## Initial Commands ##  

# Makes it possible to move dotfiles using *
shopt -s dotglob

    ## Main Script ##

# Clones repository
git clone "https://github.com/esgameco/dotfiles"

# Moves all dotfiles to ~
mv ./dotfiles/* ${base_dir}

# Deletes dotfiles repository
rm -r ./dotfiles
