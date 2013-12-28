rvm_shell 'rake db:drop' do
  cwd         '/var/www/demo'
  user        node['rvm']['user_installs'][0]['user']
  ruby_string node['rvm']['user_installs'][0]['default_ruby']
  code        'rake db:drop'
end

rvm_shell 'rake db:create' do
  cwd         '/var/www/demo'
  user        node['rvm']['user_installs'][0]['user']
  ruby_string node['rvm']['user_installs'][0]['default_ruby']
  code        'rake db:create'
end

rvm_shell 'rake db:migrate' do
  cwd         '/var/www/demo'
  user        node['rvm']['user_installs'][0]['user']
  ruby_string node['rvm']['user_installs'][0]['default_ruby']
  code        'rake db:migrate'
end

rvm_shell 'rake db:seed' do
  cwd         '/var/www/demo'
  user        node['rvm']['user_installs'][0]['user']
  ruby_string node['rvm']['user_installs'][0]['default_ruby']
  code        'rake db:seed'
end