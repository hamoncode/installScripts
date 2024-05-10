#!/bin/zsh

# Install additional apt packages
sudo apt install -y build-essential curl flatpak gh kitty neofetch nodejs npm pandoc pipewire ripgrep tmux wireplumber xclip zathura zathura-pdf-poppler

# Install snap packages
sudo apt install snapd
sudo snap install core
sudo snap install discord intellij-idea-community nordpass spotify zoom-client

# Install nvim with astroNvim package
sudo snap install nvim --classic
rm -rf ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
