# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "10.10.10.10"

  config.vm.synced_folder ".", "/ansible/roles/ansible-bigbluebutton"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install --assume-yes software-properties-common
    apt-add-repository --yes ppa:ansible/ansible
    apt-get update
    apt-get --assume-yes install ansible
  SHELL
end
