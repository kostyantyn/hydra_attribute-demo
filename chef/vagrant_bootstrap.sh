#!/bin/bash

cd `dirname $0`
bundle install
vagrant up
bundle exec knife solo bootstrap vagrant@localhost -i .chef/insecure_private_key -p 2222