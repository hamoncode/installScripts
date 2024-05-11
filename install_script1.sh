#!/bin/bash

# Function for logging messages
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Update and upgrade apt package lists
log "Updating and upgrading apt package lists..."
sudo apt update && sudo apt upgrade || { log "Error updating and upgrading apt packages"; exit 1; }

# Install essential packages
log "Installing essential packages..."
sudo apt install -y git gh wget zsh || { log "Error installing essential packages"; exit 1; }

# Configure GitHub CLI
log "Configuring GitHub CLI..."
echo "Please provide input for configuration of GitHub CLI"
gh auth login || { log "Error configuring GitHub CLI"; exit 1; }

# Install Oh My Zsh
log "Installing Oh My Zsh..."
echo "Please provide input for configuration of Oh My Zsh"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" || { log "Error installing Oh My Zsh"; exit 1; }

log "Installation completed successfully!"


# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
