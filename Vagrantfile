# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  ["zabbix-server01"].each_with_index do |n,i|
   config.vm.define n do |v|
    v.vm.hostname = n
    v.vm.network :private_network, ip: "192.168.33.#{41+i}"
    v.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
    end
   end
  end

  ["elastic01", "elastic02", "elastic03"].each_with_index do |n,i|
   config.vm.define n do |v|
    v.vm.hostname = n
    v.vm.network :private_network, ip: "192.168.33.#{51+i}"
    v.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
    end
   end
  end

 ["httpd01","httpd02","httpd03"].each_with_index do |n,i|
  config.vm.define n do |v|
   v.vm.network :private_network, ip: "192.168.33.#{61+i}"
   v.vm.provider "virtualbox" do |vb|
    vb.memory = "256"
   end
  end
 end
 config.vm.provision "ansible" do |ansible|
  ansible.playbook = "site.yml"
  ansible.sudo = true
  #ansible.verbose = 'vvv'
  ansible.host_key_checking = false
  ansible.inventory_path = "production"
 end
end
