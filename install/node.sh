#!/usr/bin/env bash

echo "Installing nodeJS 10.x ..."

curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install -y nodejs

echo "nodejs installation done"
