VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.synced_folder '.', '/opt/demo', nfs: true

  config.vm.network :private_network, ip: '10.0.10.2'
  config.vm.network :forwarded_port, host: 8080, guest: 80

  config.ssh.forward_agent = true
end