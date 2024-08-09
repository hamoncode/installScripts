#!/bin/sh

# files for parsing
PACKAGE_PAC="packagePac.txt"

# vérification that files exists
if [[ ! -f "$PACKAGE_PAC" ]]; then
  echo "error: $PACKAGE_PAC not found"
  exit 1
fi

# parser avec cat les fichier
PackagesPac=$(cat "$PACKAGE_PAC")

# Update and upgrade package lists
echo "Updating and upgrading apt package lists..."
sudo pacman -Syu || { echo "Error updating Pacman packages"; exit 1; }

# Install apt packages
echo "Installing apt packages..."
for package in $PackagesPac; do
  sudo pacman -S "$package" --noconfirm || { echo "Error installing $package"; exit 1; }
done

# Update package lists
echo "Updating package lists..."
sudo pacman -Syu || { echo "Error updating Pacman packages"; exit 1; }

# configure nvim with astroNvim package
echo "Installing nvim with AstroNvim package..."
rm -rf ~/.config/nvim || { echo "error removing nvim config"; exit 1; }
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim || { echo "Error cloning AstroNvim template"; exit 1; }
rm -rf ~/.config/nvim/.git 

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sudo pacman -Sy zsh || { echo "Error installing zsh"; exit 1; }
echo "Please provide input for configuration of Oh My Zsh"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { echo "Error installing Oh My Zsh"; exit 1; }

echo "Installation completed successfully!"
echo "now would be a good idea to reboot"
