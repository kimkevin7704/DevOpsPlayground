# -*- mode: ruby -*-
# vi: set ft=ruby :

# Author: Kevin Kim
# Date Created: 10/13/2022
# Last Modified: 10/13/2022

Vagrant.configure("2") do |config|
  config.vm.define "dev"
  config.vm.hostname = "dev"
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.33.10"
  # app folder will be synced in the vm at /home/vagrant/app
  config.vm.synced_folder "./app", "/home/vagrant/app"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "dev"
    vb.gui = false
    vb.memory = "2048"
  end

  # provisioning
  # nginx install requires -y or shell will hang waiting for confirmation
  # if nginx is installed, this will not run everytime
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y nginx
  SHELL

  # example shell that will run every time
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    echo "Hello from the Vagrantfile"
  SHELL
end