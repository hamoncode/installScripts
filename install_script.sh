#!/bin/bash

# files for parsing
PACKAGE_APT="packageApt.txt"
PACKAGE_SNAP="packageSnap.txt"

# vérification that files exists
if [[ ! -f "$PACKAGE_APT" ]]; then
  echo "error: $PACKAGE_APT not found"
  exit 1
fi

if [[ ! -f "$PACKAGE_SNAP" ]]; then
  echo "error: $PACKAGE_SNAP not found"
  exit 1
fi

# parser avec cat les fichier
PackagesApt=$(cat "$PACKAGE_APT")
PackagesSnap=$(cat "$PACKAGE_SNAP")

# Update and upgrade apt package lists
echo "Updating and upgrading apt package lists..."
sudo apt update && sudo apt upgrade || { echo "Error updating and upgrading apt packages"; exit 1; }

# Install apt packages
echo "Installing apt packages..."
for package in $PackagesApt; do
  sudo apt install -y "$package" || { echo "Error installing $package"; exit 1; }
done

# Install snap packages
 echo "Installing snap packages..."
for package in $PackagesSnap; do
  sudo apt install -y "$package" || { echo "Error installing $package"; exit 1; }
done

# Update package lists
echo "Updating package lists..."
sudo apt update
sudo snap update

# Configure GitHub CLI
echo "Configuring GitHub CLI..."
echo "Please provide input for configuration of GitHub CLI"
gh auth login || { echo "Error configuring GitHub CLI"; exit 1; }

# configure nvim with astroNvim package
echo "Installing nvim with AstroNvim package..."
rm -rf ~/.config/nvim || { echo "error removing nvim config"; exit 1; }
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim || { echo "Error cloning AstroNvim template"; exit 1; }
rm -rf ~/.config/nvim/.git 

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sudo apt install zsh || { echo "Error installing zsh"; exit 1; }
echo "Please provide input for configuration of Oh My Zsh"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { echo "Error installing Oh My Zsh"; exit 1; }

echo "Installation completed successfully!"
echo "now would be a good idea to reboot"
