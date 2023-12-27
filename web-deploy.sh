#!/bin/bash

# This file deploys my website.

if (which nginx > /dev/null)
then
  echo 'nginx is already installed'
else
  echo 'installing nginx'
  sudo apt install -y nginx
fi

if (grep 'VTVL' /var/www/html/index.nginx-debian.html > /dev/null)
then
  echo "web page already deployed"
else
  echo "deploying webpage"
  sudo cp index.html /var/www/html/index.nginx-debian.html
fi
