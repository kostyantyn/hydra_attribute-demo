rvm_shell 'kill -QUIT `cat tmp/pids/unicorn.pid`' do
  only_if { File.exists?('/var/www/demo/tmp/pids/unicorn.pid') }
  cwd  '/var/www/demo'
  user node['rvm']['user_installs'][0]['user']
  code 'kill -QUIT `cat tmp/pids/unicorn.pid`'
end

[
  'rake tmp:clear',
  'rake tmp:create',
  'unicorn -c config/unicorn.rb -D'
].each do |command|
  rvm_shell command do
    cwd         '/var/www/demo'
    user        node['rvm']['user_installs'][0]['user']
    ruby_string node['rvm']['user_installs'][0]['default_ruby']
    code        command
  end
end