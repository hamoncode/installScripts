#!/bin/zsh

# permalink pour .zshrc file
rm -rf ~/.zshrc || echo {"erreur pas de zshrc trouvé"; exit 1;}
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# permalink pour les desktops shortcut

rm -rf ~/.local/share/applications || echo {"erreur pas de folder applications trouvé"; exit 1;}
ln -s ~/.dotfiles/applications ~/.local/share/applications
