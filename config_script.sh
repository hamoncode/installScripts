#!/bin/sh

# symlink .zshrc
if [ -f ~/.zshrc ]; then
    rm -f ~/.zshrc || { echo "Erreur: impossible de supprimer .zshrc"; exit 1; }
fi
ln -s ~/.dotfiles/.zshrc ~/.zshrc || { echo "Erreur: problème lors de la création du symlink pour .zshrc"; exit 1; }

# symlink .desktop shortcuts
if [ -d ~/.local/share/applications ]; then
    rm -rf ~/.local/share/applications || { echo "Erreur: impossible de supprimer le dossier applications"; exit 1; }
fi
ln -s ~/.dotfiles/applications ~/.local/share/applications || { echo "Erreur: problème lors de la création du symlink pour applications"; exit 1; }

# symlink fonts
if [ -d ~/.local/share/fonts ]; then
    rm -rf ~/.local/share/fonts || { echo "Erreur: impossible de supprimer le dossier fonts"; exit 1; }
fi
ln -s ~/.dotfiles/fonts ~/.local/share/fonts || { echo "Erreur: problème lors de la création du symlink pour fonts"; exit 1; }

# symlink .config
if [ -d ~/.config ]; then
    rm -rf ~/.config || { echo "Erreur: impossible de supprimer le dossier .config"; exit 1; }
fi
ln -s ~/.dotfiles/.config ~/.config || { echo "Erreur: problème lors de la création du symlink pour .config"; exit 1; }

# Ensure /usr/local/bin exists
sudo mkdir -p /usr/local/bin

# Symlink the pacman logging script
if [ ! -L /usr/local/bin/log_pacman.sh ]; then
    sudo ln -s "$HOME/.dotfiles/bin/log_pacman.sh" /usr/local/bin/log_pacman.sh
    echo "Symlinked logging script."
fi



# Clone external plugins (Quickfix)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || { echo "Erreur: problème lors du clonage de zsh-autosuggestions"; exit 1; }
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { echo "Erreur: problème lors du clonage de zsh-syntax-highlighting"; exit 1; }
git clone https://github.com/marlonrichert/zsh-autocomplete.git || { echo "Erreur: problème lors du clonage de zsh-autocomplete"; exit 1; }

# fix manuel du dernier pluggin (Quickfix)
mv ./zsh-autocomplete ~/.oh-my-zsh/plugins || { echo "erreur durant le fix zsh-autocomplete"; exit 1; }

echo "Configurations réussi!"
