#!/bin/zsh

# Set the dotfiles directory path
DOTFILES_DIR="$HOME/dotfiles"

# Create the dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Change to the dotfiles directory
cd "$DOTFILES_DIR" || { echo "Error: Unable to change directory to $DOTFILES_DIR"; exit 1; }

# Set up symbolic link for shell configuration file
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc && echo "Shell configuration symbolic link set up successfully."

# Set up symbolic links for .desktop files
DESKTOP_DIR="$HOME/.local/share/applications"
mkdir -p "$DESKTOP_DIR"
for file in "$DOTFILES_DIR/.local/share/applications"/*.desktop; do
    ln -sf "$file" "$DESKTOP_DIR/" && echo ".desktop file symbolic link set up successfully."
done

# Switch default shell to Zsh
chsh -s "$(which zsh)" && echo "Default shell changed to Zsh."
