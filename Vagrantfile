# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant documentation: https://docs.vagrantup.com
# Vagrant Boxes:         https://vagrantcloud.com/search

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1804" # The name of the vagrant box to use to instantiate a vm
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "ubuntu1804" # The name of the instance as shown in VirtualBox's GUI
    vb.memory = "512"
  end
  
  config.vm.synced_folder "./", "/vagrant", type: "virtualbox", disabled: false, id: "vagrant-root",
    owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=775,fmode=664"]
	
  config.vm.provision "ansible_local" do |ansible|
	ansible.install_mode = "pip"
	ansible.playbook = "provisioning/playbook.yml"
	ansible.galaxy_roles_path = "/etc/ansible/roles"
	ansible.galaxy_role_file = "provisioning/requirements.yml"
	ansible.verbose = "v" # https://serverfault.com/questions/531891/how-do-i-enable-additional-debugging-output-from-ansible-and-vagrant#answer-611070
	ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
  end
end
