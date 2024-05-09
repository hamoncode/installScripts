#!/bin/bash

# start of the first installation script

sudo apt update

# install git 

sudo apt install git

# install wget

sudo apt install wget

# install zsh 

sudo apt install zsh 

# lauch zsh

zsh

# install omz 

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# follow the steps and then lauch install-script2
