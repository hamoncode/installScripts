#!/bin/bash

# Update apt package lists
sudo apt update

# Install git
sudo apt install -y git

# Install wget
sudo apt install -y wget

# Install zsh
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install additional apt packages
sudo apt install -y build-essential curl flatpak gh kitty librewolf neofetch nodejs npm pandoc pipewire ripgrep snapd tmux wireplumber xclip zathura zathura-pdf-poppler

# Install snap packages
sudo snap install discord emacs intellij-idea-community nordpass spotify zoom-client

