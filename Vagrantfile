# -*- mode: ruby -*-
# vi: set ft=ruby :

# Author: Kevin Kim
# Date Created: 10/13/2022
# Last Modified: 10/13/2022

# Globals
vm_box            = "bento/ubuntu-22.04"
vm_mem            = "2048"
sync_folder_host  = "./app"
sync_folder_vm    = "/home/vagrant/app"

Vagrant.configure("2") do |config|
# DEV
  config.vm.define :dev do |dev|
    dev.vm.hostname = "dev"
    dev.vm.box = vm_box
    dev.vm.network :forwarded_port, guest: 80, host: 8080, host_ip: "127.0.0.1"
    dev.vm.network :private_network, ip: "192.168.33.10"
    # app folder will be synced in the vm at /home/vagrant/app
    dev.vm.synced_folder sync_folder_host, sync_folder_vm
    dev.vm.provider "virtualbox" do |vb|
      vb.name = "dev"
      vb.gui = false
      vb.memory = vm_mem
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
    echo "Hello from the dev VM"
    nginx -v
    echo "enabling firewall"
    echo y | sudo ufw enable
    sudo ufw allow 'Nginx Full'
    sudo ufw allow 'Nginx HTTP'
    sudo ufw allow 'Nginx HTTPS'
    sudo cp -r /home/vagrant/app/. /var/www/
  SHELL
  end
  
# STAGING
  config.vm.define :staging do |staging|
    staging.vm.hostname = "staging"
    staging.vm.box = vm_box
    staging.vm.network "forwarded_port", guest: 80, host: 8081, host_ip: "127.0.0.1"
    staging.vm.network "private_network", ip: "192.168.33.20"
    # app folder will be synced in the vm at /home/vagrant/app
    staging.vm.synced_folder sync_folder_host, sync_folder_vm
    staging.vm.provider "virtualbox" do |vb|
      vb.name = "staging"
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
    echo "Hello from the staging VM"
    nginx -v
    echo "enabling firewall"
    echo y | sudo ufw enable
    sudo ufw allow 'Nginx Full'
    sudo ufw allow 'Nginx HTTP'
    sudo ufw allow 'Nginx HTTPS'
    sudo cp -r /home/vagrant/app/. /var/www/
  SHELL
  end

# PRODUCTION
  config.vm.define :production do |production|
    production.vm.hostname = "production"
    production.vm.box = vm_box
    production.vm.network "forwarded_port", guest: 80, host: 8082, host_ip: "127.0.0.1"
    production.vm.network "private_network", ip: "192.168.33.30"
    # app folder will be synced in the vm at /home/vagrant/app
    production.vm.synced_folder sync_folder_host, sync_folder_vm
    production.vm.provider "virtualbox" do |vb|
      vb.name = "production"
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
    echo "Hello from the production VM"
    nginx -v
    echo "enabling firewall"
    echo y | sudo ufw enable
    sudo ufw allow 'Nginx Full'
    sudo ufw allow 'Nginx HTTP'
    sudo ufw allow 'Nginx HTTPS'
    sudo cp -r /home/vagrant/app/ /var/www/
  SHELL
  end

end
