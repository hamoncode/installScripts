#!/bin/zsh

log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# permalink pour .zshrc file
rm -rf ~/.zshrc || log <"erreur pas de zshrc trouvé" exit 1>
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# permalink pour les desktops shortcut

rm -rf ~/.local/share/applications
ln -s ~/.dotfiles/application ~/.local/share/applications
