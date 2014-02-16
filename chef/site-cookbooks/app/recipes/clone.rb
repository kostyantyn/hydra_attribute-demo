case node['environment']
when 'production'
  directory '/var/www/demo' do
    action 'delete'
  end

  execute 'ssh-keyscan -H github.com > ~/.ssh/known_hosts' do
    command 'ssh-keyscan -H github.com > ~/.ssh/known_hosts'
    user    'root'
  end

  git '/var/www/demo' do
    repository 'git@github.com:kostyantyn/hydra_attribute-demo.git'
  end

  directory '/var/www/demo' do
    user      node['app']['user']
    group     node['app']['group']
    mode      '0744'
    recursive true
  end
when 'development'
  link '/opt/demo' do
    to '/var/www/demo'
  end
else
end