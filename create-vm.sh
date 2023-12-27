#!/bin/bash

# This file installs multipass.

if (which multipass > /dev/null)
then
  echo "multipass already installed"
else
  echo "installing multipass"
  sudo snap install multipass
fi
