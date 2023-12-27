#!/bin/bash

# This file installs multipass.

if (multipass version)
then
  echo "multipass already installed"
else
  echo "installing multipass"
  sudo snap install multipass
fi
