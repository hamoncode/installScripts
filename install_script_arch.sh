#!/bin/sh

# fichiers à parser
PACKAGE_PAC="packagePac.txt"

# vérification que le fichier se trouve dans le repo
if [[ ! -f "$PACKAGE_PAC" ]]; then
  echo "error: $PACKAGE_PAC not found"
  exit 1
fi

# parser avec cat les fichiers
PackagesPac=$(cat "$PACKAGE_PAC")

# Update 
echo "Updating and upgrading pacman package lists..."
sudo pacman -Syu || { echo "Error first update Pacman packages"; exit 1; }

# Install pacman packages
echo "Installing pacman packages..."
for package in $PackagesPac; do
  sudo pacman -S "$package" --noconfirm || { echo "Error installing $package"; exit 1; }
done

# Update pour s'assurer tous les packages sont à jours
echo "Updating package lists..."
sudo pacman -Syu || { echo "Error second update Pacman packages"; exit 1; }

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sudo pacman -Sy zsh || { echo "Error installing zsh"; exit 1; }
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { echo "Error installing Oh My Zsh"; exit 1; }
