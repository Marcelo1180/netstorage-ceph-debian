vm_memory = 256
vm_cpus = 1

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  config.vm.provider :virtualbox do |vb|
    vb.memory = vm_memory
    vb.cpus = vm_cpus
  end

  config.vm.define "cephclient" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.9", virtualbox__intnet: "true"
  end

  config.vm.define "cephadm1" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "true"
  end

  config.vm.define "cephmon1" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.11", virtualbox__intnet: "true"
  end

  config.vm.define "cephmon2" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.12", virtualbox__intnet: "true"
  end

  config.vm.define "cephmon3" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.13", virtualbox__intnet: "true"
  end

  # config.vm.define "admin1" do |config|
  #    config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
  #    config.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "true"
  # end
  #
  # config.vm.define "osd1" do |config|
  #    config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
  #    config.vm.network "private_network", ip: "192.168.50.11", virtualbox__intnet: "true"
  # end
  #
  # config.vm.define "osd2" do |config|
  #    config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
  #    config.vm.network "private_network", ip: "192.168.50.12", virtualbox__intnet: "true"
  # end
  #
  # config.vm.define "osd2" do |config|
  #    config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
  #    config.vm.network "private_network", ip: "192.168.50.13", virtualbox__intnet: "true"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
