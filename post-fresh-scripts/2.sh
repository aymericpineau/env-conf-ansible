#!/bin/bash

# https://www.vagrantup.com/docs/boxes/base.html#default-user-settings
# Prerequisites: install lubuntu (user: vagrant / pwd: vagrant)

# Set colors as vars
rstclr="\e[0m"
red="\e[31m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
lghred="\e[91m"
lghgrn="\e[92m"

# Set commands as a var
cmd1="mkdir -p /home/vagrant/.ssh/"
cmd2="wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub --directory-prefix=/home/vagrant/ --output-document=authorized_keys"
cmd3="mv /home/vagrant/authorized_keys /home/vagrant/.ssh/"
cmd4="chmod 700 /home/vagrant/.ssh/"
cmd5="chmod 600 /home/vagrant/.ssh/authorized_keys"
cmd6="chown vagrant:vagrant /home/vagrant/.ssh/ -R"
cmd7="apt-get clean"
cmd8="apt-get autoclean"
cmd9="apt-get autoremove"
cmd10="passwd root" # (set it to "vagrant")
done="echo -e $grn ... Done $rstclr"

echo -e "$ylw This script configures a base lubuntu image to work with Vagrant automatic deployement. $rstclr"
sleep 1
echo -e "$ylw It runs the following commands: $rstclr"
echo -e " 1.$cyn $cmd1 $rstclr"
echo -e " 2.$cyn $cmd2 $rstclr"
echo -e " 3.$cyn $cmd3 $rstclr"
echo -e " 4.$cyn $cmd4 $rstclr"
echo -e " 5.$cyn $cmd5 $rstclr"
echo -e " 6.$cyn $cmd6 $rstclr"
echo -e " 7.$cyn $cmd7 $rstclr"
echo -e " 8.$cyn $cmd8 $rstclr"
echo -e " 9.$cyn $cmd9 $rstclr"
echo -e " 10.$cyn $cmd10 $rstclr"
echo
sleep 3


echo -e "$cyn $cmd1 $rstclr"
sleep 1
$cmd1
$done
echo

echo -e "$cyn $cmd2 $rstclr"
sleep 1
$cmd2
$done
echo

echo -e "$cyn $cmd3 $rstclr"
sleep 1
$cmd3
$done
echo

echo -e "$cyn $cmd4 $rstclr"
sleep 1
$cmd4
$done
echo

echo -e "$cyn $cmd5 $rstclr"
sleep 1
$cmd5
$done
echo

echo -e "$cyn $cmd6 $rstclr"
sleep 1
$cmd6
$done
echo

echo -e "$cyn $cmd7 $rstclr"
sleep 1
$cmd7
$done
echo

echo -e "$cyn $cmd8 $rstclr"
sleep 1
$cmd8
$done
echo

echo -e "$cyn $cmd9 $rstclr"
sleep 1
$cmd9
$done
echo

echo -e "$cyn $cmd10 (set it to 'vagrant') $rstclr"
sleep 1
$cmd10
$done
echo
