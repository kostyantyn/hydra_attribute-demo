template "#{node['nginx']['dir']}/sites-enabled/demo" do
  source 'nginx/demo.erb'
end

nginx_site 'demo' do
  action :enable
end