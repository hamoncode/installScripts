# documentation intallation script pour Debian 12

## préparation

- donner permission au scripts de s'executer

chmod +x install_script.sh  config_script.sh

## étapes de l'installation

1) lancer le install script

./install_script.sh

2) importer les dotfiles selon système au choix

3) lancer le script qui finalise la configuration

./config_script.sh

4) quick fix error zshrc

a) installer packages externes qu'il manque

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git 

b) mettre zsh-autosuggestion dans ~/.oh-my-zsh/plugin

