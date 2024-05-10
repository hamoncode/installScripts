#!/bin/bash

# Change directory to the dotfiles repository
cd ~/dotfiles

# Set up symbolic links for shell configuration files
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "Shell configuration symbolic link set up successfully."

# Set up symbolic links for .desktop files
# Assuming your .desktop files are located in ~/dotfiles/.local/applications
# Modify the destination directory based on where you want the links to be created
# For user-specific applications in GNOME, it's usually ~/.local/share/applications

# Ensure the target directory exists
mkdir -p ~/.local/share/applications

# Create symbolic links for each .desktop file
for file in ~/dotfiles/.local/applications/*.desktop; do
    ln -sf "$file" ~/.local/share/applications/
done

echo ".desktop file symbolic links set up successfully."

# Switch default shell to Zsh
chsh -s "$(which zsh)"

echo "Default shell changed to Zsh."
