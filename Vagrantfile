# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  ["node01", "node02", "node03"].each_with_index do |n,i|
  	config.vm.define n do |v|
	 v.vm.hostname = n
	 v.vm.network :private_network, 
	 	ip: "192.168.33.#{51+i}"
	end
  end

 ["httpd01"].each_with_index do |n,i|
  config.vm.define n do |v|
   v.vm.network :private_network,
    ip: "192.168.33.#{61+i}"
  end
 end
 #["search", "httpd"].each do |l|
  config.vm.provision "ansible" do |ansible|
   ansible.playbook = "site.yml"
   ansible.sudo = true
   #ansible.verbose = 'vvv'
   ansible.host_key_checking = false
   ansible.inventory_path = "production"
   #ansible.limit = l
  end
 #end
end
