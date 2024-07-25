#!/bin/bash

# Import stable version of NeoVim PPA
sudo add-apt-repository ppa:neovim-ppa/unstable -y || { echo "erreur installation ppa repo" , exit 1 ; }

# update system
sudo apt update

# install neovim
sudo apt install neovim

# remove ppa
sudo add-apt-repository --remove ppa:neovim-ppa/unstable || { echo "erreur desinstallation ppa repo" , exit 1 ; }

# message reussite
echo "installation réussi"
