rvm_shell 'kill -QUIT `cat tmp/pids/unicorn.pid`' do
  only_if { File.exists?('/var/www/demo/tmp/pids/unicorn.pid') }
  cwd  '/var/www/demo'
  user node['rvm']['user_installs'][0]['user']
  code 'kill -QUIT `cat tmp/pids/unicorn.pid`'
end

rvm_shell 'unicorn -c config/unicorn.rb -D' do
  cwd         '/var/www/demo'
  user        node['rvm']['user_installs'][0]['user']
  ruby_string node['rvm']['user_installs'][0]['default_ruby']
  code        'unicorn -c config/unicorn.rb -D'
end