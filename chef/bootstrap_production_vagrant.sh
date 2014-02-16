#!/bin/bash

cd `dirname $0`
bundle install
vagrant up
chmod 0600 .chef/insecure_private_key
bundle exec knife solo bootstrap vagrant@hydra-attribute-demo.dev -i .chef/insecure_private_key -p 2222 -E production