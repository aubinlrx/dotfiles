#!/bin/bash

# Default packages 
apt update
apt install -y git build-essentials tcl libssl-dev

# Mysql
apt install -y mysql-server mysql-client libmysqlclient-dev

# Imagemagick
apt install imagemagick libmagickwand-dev

# QT5
apt install -y qt5-qmake qt5-default libqt5webkit5-dev xvfb

# Mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt install -y mongodb-org

# Redis

# RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
cd /tmp
curl -sSL https://get.rvm.io -o rvm.sh
cat /tmp/rvm.sh | bash -s stable --rails
source $HOME/.rvm/scripts/rvm

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

# Rust
sudo curl https://sh.rustup.rs -sSf | sh

# Alacritty
./install/alacritty.sh


# Prepare /Code directory
mkdir $HOME/Code
mkdir $HOME/Code/personnal
mkdir $HOME/Code/work
mkdir $HOME/Code/sandbox
