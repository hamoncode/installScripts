#!/bin/bash

# Update and upgrade apt package lists

sudo apt update && sudo apt upgrade

# Install essential packages 
sudo apt install -y git gh wget zsh 

echo "please provide input for configuration of ohmyzsh"

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
