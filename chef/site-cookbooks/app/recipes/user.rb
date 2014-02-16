group node['app']['group']

user node['app']['user'] do
  home  "/home/#{node['app']['user']}"
  gid   node['app']['group']
  shell '/bin/bash'
end

directory "/home/#{node['app']['user']}" do
  owner node['app']['user']
  group node['app']['group']
  mode '0751'
end