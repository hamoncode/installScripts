# documentation intallation script pour Debian 12

## comment faire de ce install script facilement le vôtre

le install script parse deux fichiers textes (packageApt.txt et packageSnap.txt)
- remplacer avec les noms des packages que vous utilisez dans ces fichiers avant de lancer le script.
  - recherchez la doc avant les noms peuvent varier d'une distro à l'autre
    ex: nvim --classic (snap)

## étapes de l'installation

1) donner permission au scripts de s'executer

chmod u+x install_script.sh 

2) lancer le install script

./install_script.sh

### postnotes 

- le reste des étapes est d'importer vos dotfiles avec le système de votre choix.
  - perso j'utilise un repo git et je crée des simlinks (ex:config_script.sh)

- il existe d'autre système comme stow et chezmoi qui sont plus robustes/maléables.
