#!/usr/bin/env bash

echo "installing python..."

# Install Python3
sudo apt install python3-minimal

# Install Pip
sudo apt install python-pip python-dev build-essential
sudo pip install --upgrade distribute
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

echo "installing python packages..."
packages =(
    isort
)

pip install "${packages[@]}"

echo "python install done"
