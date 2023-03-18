#!/bin/sh
sudo apt update 
sudo apt install apt-transport-https curl

sudo apt install ibus-chewing
sudo apt install vlock
sudo apt install libfuse # for balena etcher

sudo apt install openssh-server
sudo apt install openssh-client

sudo apt install sysstat
sudo apt install brave-browser

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
bash Anaconda-latest-Linux-x86_64.sh
