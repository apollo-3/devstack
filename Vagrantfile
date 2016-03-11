Vagrant.configure(2) do |config|
  config.vm.box = "centos7x64"
  config.vm.hostname = "openstack"

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.network "private_network", ip: "192.168.33.11"
  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true
    vb.memory = "4096"
  end

  config.vm.provision "shell", path: "start.sh" 
end
