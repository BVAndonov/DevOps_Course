# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false

  config.vm.define "web" do |web|
    web.vm.box = "bvandonov/webApp"
    web.vm.hostname = "web.hw1.lab"
    web.vm.network "private_network", ip: "192.168.99.101"
    web.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
    web.vm.provision "shell", path: "web.sh"
  end
  
  config.vm.define "db" do |db|
    db.vm.box = "bvandonov/webApp"
    db.vm.hostname = "db.hw1.lab"
    db.vm.network "private_network", ip: "192.168.99.102"
    db.vm.provision "shell", path: "db.sh"
  end
end
