#!/bin/bash

: '
    install_go.sh

    A Go installer
    The following operations are performed:
        1. Download and extract Go to /usr/local
        2. Install necessary Go binaries
'

    ## Instance Variables ##

download_dir=~/Downloads
version_name="go1.17.4.linux-amd64.tar.gz"

    ## Main Script ##

# Only install if Go doesn't exist
if [[ ! -e /usr/local/go ]]; then
    # Download and export Go repository
    wget -O ${download_dir}/go.tar.gz https://go.dev/dl/${version_name}
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ${download_dir}/go.tar.gz
    rm ${download_dir}/go.tar.gz
fi

# Install Go binaries
vim +'silent :GoInstallBinaries' +qall
