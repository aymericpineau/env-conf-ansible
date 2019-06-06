# How to
1. Create a new VirtualBox image using an iso file using user:```vagrant``` / pwd:```vagrant``` (I use ubuntu-server)
2. Set ```/etc/apt/apt.conf.d/20auto-upgrades``` vars to 0.
3. Run ```1.sh``` (installs: linux-headers, build-essential, dkms, VBoxGuestAdditions). The VM will reboot.
4. Run ```2.sh``` (installs: vagrant insecure ssh_key. Changes root pwd to ```vagrant``` (user input required))
5. Run ```apt-get update``` & ```apt-get upgrade``` manually to make sure everythong is up to date.
5. Poweoff the vm

1. On your Windows host, create a new folder like so: C:\Users\roger\VirtualBox VMs\vagrant
2. Run ```cd C:\Users\roger\VirtualBox VMs\vagrant```
3. Run ```vagrant box add --name ansible file://ansible``` to add the box to vagrant available boxes
4. Run ```vagrant box list``` to check the box is present
5. Make sure ```Vagrantfile ansible.cfg hosts playbook.yml requirements.yml``` are in ```C:\Users\roger\VirtualBox VMs\vagrant```
6. Run ```vagrant up --provision```