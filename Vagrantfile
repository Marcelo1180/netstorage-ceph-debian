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

  config.vm.define "cephosd1" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.21", virtualbox__intnet: "true"
     config.vm.disk :disk, size: "10GB", name: "extra_storage"
  end

  config.vm.define "cephosd2" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.22", virtualbox__intnet: "true"
     config.vm.disk :disk, size: "10GB", name: "extra_storage"
  end

  config.vm.define "cephosd3" do |config|
     config.vm.provision :shell, :inline => "ip addr | grep \"inet\" | awk '{print $2}'"
     config.vm.network "private_network", ip: "192.168.50.23", virtualbox__intnet: "true"
     config.vm.disk :disk, size: "10GB", name: "extra_storage"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y python python-pip parted xfsprogs
    sudo useradd -m -s /bin/bash cephuser
    sudo passwd -d cephuser
    echo 'cephuser ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/cephuser
    sudo chmod 0440 /etc/sudoers.d/cephuser
  SHELL
end
