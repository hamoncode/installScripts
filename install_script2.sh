#!/bin/zsh

# Function for logging messages
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Update package lists
log "Updating package lists..."
sudo apt update

# Install additional apt packages
log "Installing additional apt packages..."
sudo apt install -y build-essential curl flatpak gh kitty neofetch nodejs npm pandoc pipewire ripgrep tmux wireplumber xclip zathura zathura-pdf-poppler || { log "Error installing apt packages"; exit 1; }

# Install snap packages
log "Installing snap packages..."
sudo apt install snapd || { log "Error installing snapd"; exit 1; }
sudo snap install core || { log "Error installing snap core"; exit 1; }
sudo snap install discord || { log "Error installing discord"; exit 1; }
sudo snap install nordpass || { log "Error installing nordpass"; exit 1; }
sudo snap install spotify || { log "Error installing spotify"; exit 1; }
sudo snap install zoom-client || { log "Error installing zoom"; exit 1; }
sudo snap install intellij-idea-community --classic || {log "error installing intellij";exit 1;}

# Install nvim with astroNvim package
log "Installing nvim with AstroNvim package..."
sudo snap install nvim --classic || { log "Error installing nvim"; exit 1; }
rm -rf ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim || { log "Error cloning AstroNvim template"; exit 1; }
rm -rf ~/.config/nvim/.git

log "Installation completed successfully!"
