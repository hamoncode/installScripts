#!/bin/bash

# Change directory to the dotfiles repository
cd ~/dotfiles

# Set up symbolic links for shell configuration files
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "Symbolic links set up successfully."

# Switch default shell to Zsh
chsh -s $(which zsh)

 

