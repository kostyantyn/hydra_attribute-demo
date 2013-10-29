#!/usr/bin/env bash

# Default packages
sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y git-core
sudo apt-get install -y nginx

### Install ruby
curl -L https://get.rvm.io | bash -s stable
source "$HOME/.rvm/scripts/rvm"
rvm install ruby-1.9.3-p448
rvm use ruby-1.9.3-p448@rails3 --create --default