#!/usr/bin/env bash

echo "setting up..."

# Install applications
source install/applications.sh

# Setup node, ruby, python environment
source install/node.sh
source install/python.sh
source install/ruby.sh

# Symlink everything
source symlink.sh

echo "all done"
