#!/bin/bash

# setup local ubuntu enviornment

if [ $(sudo apt update && apt list --upgradable | wc -l) -le 1 ]
then
  echo "System already up to date"
else
  echo "Upgrading system"
  sudo apt upgrade -y
  sudo apt install -y $(apt list --upgradable | tr '/' ' ' | awk '{ print $1 }' | tail -n +2 | tr '\n' ' ')
fi

if (id -u stephen > /dev/null)
then
  echo 'User stephen already exists'
else
  echo 'Creating user stephen'
  sudo useradd -p $(openssl passwd -1 password123) -g sudo -m stephen -s /usr/bin/bash
fi

if (which nginx > /dev/null)
then
  echo 'nginx is already installed'
else
  echo 'installing nginx'
  sudo apt install -y nginx
fi

if (which curl > /dev/null)
then 
  echo 'curl is already installed'
else 
  echo 'installing curl'
  sudo apt install -y curl 
fi 

if (which git > /dev/null)
then 
  echo 'git is already installed'
else 
  echo 'installing git'
  sudo apt install -y git 
fi
 
if (git config --global --get user.email | grep rodas.huerobruce@gmail.com
 > /dev/null)
then 
  echo 'git email is already configured'
else 
  echo 'configuring git email'
  git config --global user.email "rodas.huerobruce@gmail.com"
fi 

if (git config --global --get user.name | grep "Huero Rodas"
 > /dev/null)
then 
  echo 'git name is already configured'
else 
  echo 'configuring git name'
  git config --global user.name "Huero Rodas"
fi 

if (dpkg -s openssh-server > /dev/null)
then
  echo 'openssh-server is already installed'
else
  echo 'installing openssh-server'
  sudo apt install -y openssh-server
fi

if (stat $HOME/.ssh/id_ed25519 > /dev/null)
then
  echo 'ssh key-pair already exists'
else
  echo 'creating ssh key-pair'
  ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N '' <<< y
fi

