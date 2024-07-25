#!/bin/bash


# configure debian repo

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg || { echo "config 1 échoué" ; exit 1;}
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list || { echo "config 2 échoué" ; exit 1;}

# install spotify client

sudo apt-get update && sudo apt-get install spotify-client || { echo "installation échoué" ; exit 1;}

# message reussite

echo "installation reussi"
