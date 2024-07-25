#!/bin/zsh

# symlink pour .zshrc file
rm -rf ~/.zshrc ||  { echo "erreur pas de zshrc trouvé"; exit 1; }
ln -s ~/.dotfiles/.zshrc ~/.zshrc ||  { echo "erreur durant premier symlink"; exit 1; }

# symlink pour les desktops shortcut (pour Gnome desktop apps)

rm -rf ~/.local/share/applications ||  { echo "erreur pas de folder applications trouvé"; exit 1; }
ln -s ~/.dotfiles/applications ~/.local/share/applications ||  { echo "erreur durant deuxieme symlink"; exit 1; }

# symlink pour les configurations du terminale
rm -rf ~/.config/kitty ||  { echo "erreur pas de folder applications trouvé"; exit 1; }
ln -s ~/.dotfiles/kitty ~/.config/kitty ||  { echo "erreur durant troisième symlink"; exit 1; }

# fix des pluggins externes
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || { echo "erreur durant le clone de zsh-autosuggestion"; exit 1; }
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { echo "erreur durant le clone de zsh-syntax-highlighting"; exit 1; }
git clone https://github.com/marlonrichert/zsh-autocomplete.git || { echo "erreur durant le clone de zsh-autocomplete"; exit 1; }

# fix manuel du dernier pluggin  
mv zsh-autocomplete ~/.oh-my-zsh/plugins || { echo "erreur durant le fix zsh-autocomplete"; exit 1; }

echo "configuration reussi!"

