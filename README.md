# documentation intallation script pour packages Debian 

## comment faire de ce install script facilement le vôtre

le install script parse deux fichiers textes (packageApt.txt et packageSnap.txt)
- avant de lancer le script , remplacez les noms des packages que vous utilisez dans ces fichiers.
  - recherchez la doc avant les noms peuvent varier d'une distro à l'autre
    - ex: sudo snap install nvim --classic 
      - nvim --classic (à ajouter dans 1 ligne de packgageSnap.txt)

## étapes de l'installation

1) donner permission au scripts de s'executer

chmod u+x install_script.sh 

2) lancer le install script

./install_script.sh

### postnotes 

- le reste des étapes consiste à importer vos dotfiles avec le système de votre choix.
  - perso j'utilise un repo git et je crée des simlinks (ex:config_script.sh)
  - il existe d'autre système comme stow et chezmoi qui sont plus robustes/maléables.
