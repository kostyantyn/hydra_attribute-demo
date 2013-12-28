name        'webserver'
description 'Web Server installation'
run_list(
  'recipe[powershell]', # due to the strange bug "ERROR: uninitialized constant Chef::Mixin::PowershellOut"
  'recipe[git]',
  'recipe[mysql::server]',
  'recipe[nginx]',
  'recipe[rvm::user]',
  'recipe[app]',
  'recipe[app::bundler]',
  'recipe[app::nginx]',
  'recipe[app::database]',
  'recipe[app::unicorn]'
)