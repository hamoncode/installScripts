#!/bin/bash

# Update and upgrade apt package lists

sudo apt update && sudo apt upgrade

# Install git
sudo apt install -y git gh

# Install wget
sudo apt install -y wget

# Install zsh
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install nvim with astroNvim package

sudo apt install neovim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim

# Install additional apt packages
sudo apt install -y build-essential curl flatpak gh kitty librewolf neofetch nodejs npm pandoc pipewire ripgrep snapd tmux wireplumber xclip zathura zathura-pdf-poppler

# Install snap packages
sudo snap install discord intellij-idea-community nordpass spotify zoom-client

# git config 

git config --global user.name "hamoncode"
git config --global user.email "vincent.hamon23@gmail.com"
git config --global core.editor "nvim"
gh auth login 

# Notify user about the upcoming reboot
echo "Installation complete. Rebooting the system to apply changes..."

# Reboot the system
sudo reboot

