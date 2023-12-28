#!/bin/bash

# This file installs multipass.

if (multipass version)
then
  echo "multipass already installed"
else
  echo "installing multipass"
  sudo snap install multipass
fi

# should create ssh key-pair
if (stat ./id_ed25519)
then
  echo 'ssh key-pair already exists'
else
  echo 'creating ssh key-pair'
  ssh-keygen -t ed25519 -f "./id_ed25519" -N '' <<< y
fi

# cloud-init.yaml should exist
cat <<-EOF > cloud-init.yaml
#cloud-config
users:
  - default
  - name: $USER
    ssh-authorized-keys:
      - $(cat id_ed25519.pub)
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
EOF

# should create vm
if (multipass info vtvl)
then
  echo "vtvl already exists"
else
  echo "launching vtvl"
  multipass launch --name vtvl --cloud-init cloud-init.yaml
fi

# should ssh into vm
ssh -i ./id_ed25519 -o StrictHostKeyChecking=no $USER@$(multipass info vtvl | grep IPv4 | awk '{ print $2 }')
