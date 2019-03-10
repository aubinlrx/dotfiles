#!/usr/bin/env bash

echo "Installing main packages..."

# Update / Upgrade
sudo apt update && sudo apt install -y upgrade

# Install essentials packages
sudo apt install -y git build-essential tcl libssl-dev curl

# Update / Upgrade again
sudo apt update && sudo apt -y upgrade

echo "main packages installation done"

