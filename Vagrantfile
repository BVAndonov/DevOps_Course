# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "docker" do |docker|
  docker.vm.box = "bvandonov/webApp"
  docker.vm.hostname = "docker.hw2.lab"
  docker.vm.network "private_network", ip: "192.168.99.100"
  docker.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  docker.vm.provision "shell", path: "docker-setup.sh"
    docker.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
  end
end