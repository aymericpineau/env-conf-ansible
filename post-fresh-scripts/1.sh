#!/bin/bash

# https://www.vagrantup.com/docs/boxes/base.html#default-user-settings
# Prerequisites: install ubuntu-server (user: vagrant / pwd: vagrant)

startup()
{
    set_color_vars;
    show_startup_banner;
    do_the_work;
}

set_color_vars ()
{
    # Font colors
    rstclr="\e[0m"
    blk="\e[30m"
    red="\e[31m"
    grn="\e[32m"
    ylw="\e[33m"
    cyn="\e[36m"
    lghred="\e[91m"
    lghgrn="\e[92m"
    done="echo -e $grn ... Done $rstclr"
    # Bckgd colors
    bckgd_ylw="\e[43m"
    bckgd_lghwht="\e[47m"
    bckgd_lghred="\e[101m"
    bckgd_lghgrn="\e[102m"
}

show_startup_banner ()
{
    echo -e "$ylw show_startup_banner $rstclr"
    echo -e "$bckgd_lghwht $blk ------------------------------------------ $rstclr"
    echo -e "$bckgd_ylw $blk Running 1.sh                                  $rstclr"
    echo -e "$bckgd_lghwht $blk ------------------------------------------ $rstclr"
}

do_the_work()
{
    echo -e "$cyn sed -i 's/1/0/g' /etc/apt/apt.conf.d/20auto-upgrades $rstclr"
    sleep 1
    sed -i 's/1/0/g' /etc/apt/apt.conf.d/20auto-upgrades
    $done

    echo -e "$cyn  $rstclr"
sudo su <<HEREDOC
echo "vagrant  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
HEREDOC
    
    echo -e "$cyn apt-get update $rstclr"
    sleep 1
    apt-get update
    $done
    
    echo -e "$cyn apt-get update $rstclr"
    sleep 1
    apt-get update
    $done

    echo -e "$cyn apt-get -y upgrade $rstclr"
    sleep 1
    apt-get -y upgrade
    $done

    echo -e "$cyn apt-get -y install linux-headers-$(uname -r) build-essential dkms $rstclr"
    sleep 1
    apt-get -y install linux-headers-$(uname -r) build-essential dkms
    $done

    echo -e "$cyn wget http://download.virtualbox.org/virtualbox/5.2.16/VBoxGuestAdditions_5.2.16.iso --directory-prefix=/tmp $rstclr"
    sleep 1
    wget http://download.virtualbox.org/virtualbox/5.2.16/VBoxGuestAdditions_5.2.16.iso --directory-prefix=/tmp
    $done

    echo -e "$cyn mkdir /media/VBoxGuestAdditions $rstclr"
    sleep 1
    mkdir /media/VBoxGuestAdditions
    $done

    echo -e "$cyn mount -o loop,ro /tmp/VBoxGuestAdditions_5.2.16.iso /media/VBoxGuestAdditions $rstclr"
    sleep 1
    mount -o loop,ro /tmp/VBoxGuestAdditions_5.2.16.iso /media/VBoxGuestAdditions
    $done

    echo -e "$cyn sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run $rstclr"
    sleep 1
    sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
    $done

    echo -e "$cyn rm /tmp/VBoxGuestAdditions_5.2.16.iso $rstclr"
    sleep 1
    rm /tmp/VBoxGuestAdditions_5.2.16.iso
    $done

    echo -e "$cyn umount /media/VBoxGuestAdditions $rstclr"
    sleep 1
    umount /media/VBoxGuestAdditions
    $done

    echo -e "$cyn rmdir /media/VBoxGuestAdditions $rstclr"
    sleep 1
    rmdir /media/VBoxGuestAdditions
    $done

    echo -e "$cyn reboot $rstclr"
    sleep 1
    reboot
    $done
    
}
