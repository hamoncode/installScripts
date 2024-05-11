#!/bin/bash

# Update and upgrade apt package lists
echo "Updating and upgrading apt package lists..."
sudo apt update && sudo apt upgrade || { echo "Error updating and upgrading apt packages"; exit 1; }

# Install essential packages
echo "Installing essential packages..."
sudo apt install -y git gh wget zsh || { echo "Error installing essential packages"; exit 1; }

# Configure GitHub CLI
echo "Configuring GitHub CLI..."
echo "Please provide input for configuration of GitHub CLI"
gh auth login || { echo "Error configuring GitHub CLI"; exit 1; }

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install additional apt packages
echo "Installing additional apt packages..."
sudo apt install -y build-essential curl flatpak gh kitty neofetch nodejs npm pandoc pipewire ripgrep tmux wireplumber xclip zathura zathura-pdf-poppler || { echo "Error installing apt packages"; exit 1; }

# Install snap packages
echo "Installing snap packages..."
sudo apt install snapd || { echo "Error installing snapd"; exit 1; }
sudo snap install core || { echo "Error installing snap core"; exit 1; }
sudo snap install discord || { echo "Error installing discord"; exit 1; }
sudo snap install nordpass || { echo "Error installing nordpass"; exit 1; }
sudo snap install spotify || { echo "Error installing spotify"; exit 1; }
sudo snap install zoom-client || { echo "Error installing zoom"; exit 1; }
sudo snap install intellij-idea-community --classic || { echo "error installing intellij"; exit 1; }

# Install nvim with astroNvim package
echo "Installing nvim with AstroNvim package..."
sudo snap install nvim --classic || { echo "Error installing nvim"; exit 1; }
rm -rf ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim || { echo "Error cloning AstroNvim template"; exit 1; }
rm -rf ~/.config/nvim/.git

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
echo "Please provide input for configuration of Oh My Zsh"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { echo "Error installing Oh My Zsh"; exit 1; }

# install omz external package
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git 

echo "Installation completed successfully!"
