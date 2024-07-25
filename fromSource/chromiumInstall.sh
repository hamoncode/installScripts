#!/bin/bash

#add the ppa
sudo add-apt-repository ppa:xtradeb/apps

#install chromium
sudo apt install chromium

#remove ppa
sudo add-apt-repository --remove ppa:xtradeb/apps || { echo "erreur desinstallation ppa repo" , exit 1 ; }

echo"intallation reussi"
#pas besoin de scripts de mise a jour => apt
