#!/bin/sh

# symlink .zshrc
if [ -f ~/.zshrc ]; then
    rm -f ~/.zshrc || { echo "Erreur: impossible de supprimer .zshrc"; exit 1; }
fi
ln -s ~/.dotfiles/.zshrc ~/.zshrc || { echo "Erreur: problème lors de la création du symlink pour .zshrc"; exit 1; }

# symlink .local
if [ -d ~/.local ]; then
    rm -rf ~/.local || { echo "Erreur: impossible de supprimer le dossier .local"; exit 1; }
fi
ln -s ~/.dotfiles/.local ~/.local || { echo "Erreur: problème lors de la création du symlink pour .local"; exit 1; }

# symlink .config
if [ -d ~/.config ]; then
    rm -rf ~/.config || { echo "Erreur: impossible de supprimer le dossier .config"; exit 1; }
fi
ln -s ~/.dotfiles/.config ~/.config || { echo "Erreur: problème lors de la création du symlink pour .config"; exit 1; }

# Clone external plugins (Quickfix)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || { echo "Erreur: problème lors du clonage de zsh-autosuggestions"; exit 1; }
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { echo "Erreur: problème lors du clonage de zsh-syntax-highlighting"; exit 1; }
git clone https://github.com/marlonrichert/zsh-autocomplete.git || { echo "Erreur: problème lors du clonage de zsh-autocomplete"; exit 1; }

# fix manuel du dernier pluggin (Quickfix)
mv ./zsh-autocomplete ~/.oh-my-zsh/plugins || { echo "erreur durant le fix zsh-autocomplete"; exit 1; }

# doom emacs config 
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs || { echo "erreur durant l'importation de doom emacs"; exit 1; }
~/.config/emacs/bin/doom install || { echo "erreur durant l'installation de doom emacs"; exit 1; }

# permission (Quickfix)
chmod 644 ~/.dotfiles/.wallpaper.png || { echo "erreur durant l'assignation de permission .pgn"; exit 1; }
chmod 644 ~/.dotfiles/.wallpaper.jpg || { echo "erreur durant l'assignation de permission .jpg"; exit 1; }

echo "Configurations réussi!"
