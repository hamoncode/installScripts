#!/bin/sh

# Fichiers à parser
PACKAGE_PAC="$HOME/.dotfiles/packagesPac.txt"
PACKAGE_AUR="$HOME/.dotfiles/packagesAUR.txt"

# uncomment these if you are an external user
# PACKAGE_PAC="packagesPac.txt"
# PACKAGE_AUR="packagesAUR.txt"

# Vérification que les fichiers se trouvent dans le repo
if [[ ! -f "$PACKAGE_PAC" ]]; then
  echo "Error: $PACKAGE_PAC not found"
  exit 1
fi

if [[ ! -f "$PACKAGE_AUR" ]]; then
  echo "Error: $PACKAGE_AUR not found"
  exit 1
fi

# Parser avec cat les fichiers
PackagesPac=$(cat "$PACKAGE_PAC")
PackagesAUR=$(cat "$PACKAGE_AUR")

# Update Pacman packages
echo "Updating and upgrading pacman package lists..."
sudo pacman -Syu --noconfirm || { echo "Error updating Pacman packages"; exit 1; }

# Install Pacman packages
echo "Installing Pacman packages..."
for package in $PackagesPac; do
  sudo pacman -S "$package" --noconfirm || { echo "Error installing $package"; exit 1; }
done

# Update pour s'assurer tous les packages sont à jours
echo "Updating package lists..."
sudo pacman -Syu --noconfirm || { echo "Error updating Pacman packages"; exit 1; }

# Vérifier si yay est installé
if ! command -v yay &>/dev/null; then
  echo "yay not found. Installing manually..."
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  cd /tmp/yay-bin
  makepkg -si --noconfirm || { echo "Error installing yay"; exit 1; }
  cd -
  rm -rf /tmp/yay-bin
else
  echo "yay is already installed."
fi

# Install AUR packages
echo "Installing AUR packages..."
for package in $PackagesAUR; do
  yay -S "$package" --noconfirm || { echo "Error installing $package"; exit 1; }
done

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sudo pacman -Sy zsh --noconfirm || { echo "Error installing zsh"; exit 1; }
echo "Please provide input for configuration of Oh My Zsh"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { echo "Error installing Oh My Zsh"; exit 1; }

echo "Installation completed successfully!"

