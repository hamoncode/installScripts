#!/bin/zsh
# Install nvim with astroNvim package
sudo apt install neovim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Install additional apt packages
sudo apt install -y build-essential curl flatpak gh kitty librewolf neofetch nodejs npm pandoc pipewire ripgrep snapd tmux wireplumber xclip zathura zathura-pdf-poppler

# Install snap packages
sudo snap install discord intellij-idea-community nordpass spotify zoom-client

