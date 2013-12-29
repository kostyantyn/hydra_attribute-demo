#!/bin/bash

cd `dirname $0`
bundle install
vagrant up
chmod 0644 .chef/insecure_private_key
bundle exec knife solo bootstrap vagrant@localhost -i .chef/insecure_private_key -p 2222