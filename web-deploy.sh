#!/bin/bash

# This file deploys my website.

if (grep 'VTVL' /var/www/html/index.nginx-debian.html > /dev/null)
then
  echo "web page already deployed"
else
  echo "deploying webpage"
  sudo cp index.html /var/www/html/index.nginx-debian.html
fi
