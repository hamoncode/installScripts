#!/bin/bash

# Update and upgrade apt package lists

sudo apt update && sudo apt upgrade

# Install essential packages 
sudo apt install -y git gh wget zsh 

# git config 

git config --global user.name "hamoncode"
git config --global user.email "vincent.hamon23@gmail.com"
git config --global core.editor "nvim"

echo "please provide input for configuration of git hub CLI"

gh auth login 

echo "please provide input for configuration of ohmyzsh"

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
