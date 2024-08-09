#!/bin/bash

# curl should be installed
if (curl --version)
then
  echo "**curl already installed"
else
  echo "**installing curl"
  sudo apt install -y curl
fi

# ssh key gen
if (stat $HOME/.ssh/id_ed25519)
then
  echo "ssh key already exists"
else
  echo  "creating ssh key pair"
  ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N '' <<< y
fi

# git should be installed
if (git --version)
then
  echo "**git is already installed"
else
  echo "**installing git"
  sudo apt install -y git
fi

# gh should be installed
if (gh --version)
then
  echo "**gh is already installed"
else
  echo "**installing gh"
  sudo apt install -y gh
fi

# discord should be installed
if (stat discord-0.0.61.deb)
then 
  echo "**discord-0.0.61.deb already downloaded"
else
  echo "**downloading discord-0.0.61.deb"
  curl -OJL https://dl.discordapp.net/apps/linux/0.0.61/discord-0.0.61.deb
fi

if (which discord)
then
  echo "**discord already installed"
else
  echo "**installing discord"
  sudo dpkg -i discord-0.0.61.deb
fi

# gh should be authenticated
if (gh auth status)
then
  echo "**gh already authenticated"
else
  echo "**authenticating gh"
  gh auth login
fi
