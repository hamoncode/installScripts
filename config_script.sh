#!/bin/zsh



# permalink pour .zshrc file
rm -rf ~/.zshrc || echo <"erreur pas de zshrc trouvé" exit 1>
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# permalink pour les desktops shortcut

rm -rf ~/.local/share/applications
ln -s ~/.dotfiles/application ~/.local/share/applications
