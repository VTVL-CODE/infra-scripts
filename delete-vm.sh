#!/bin/bash

# vm should not exist
multipass delete --purge vtvl && echo "deleted vtvl"

# ssh key should not exist
rm id_ed25519*

# cloud-init should not exist
rm cloud-init.yaml
