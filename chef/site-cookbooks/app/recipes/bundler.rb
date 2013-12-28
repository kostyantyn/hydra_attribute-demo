rvm_shell 'bundle install' do
  cwd         '/var/www/demo'
  user        node['rvm']['user_installs'][0]['user']
  ruby_string node['rvm']['user_installs'][0]['default_ruby']
  code        'bundle install'
end