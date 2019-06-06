#!/bin/bash

# https://www.vagrantup.com/docs/boxes/base.html#default-user-settings
# Prerequisites: install lubuntu (user: vagrant / pwd: vagrant)

startup ()
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
    echo -e "$bckgd_ylw $blk Running 1.sh                               $rstclr"
    echo -e "$bckgd_lghwht $blk ------------------------------------------ $rstclr"
}

do_the_work()
{
    echo -e "$ylw This script configures a base ubuntu image to work with Vagrant automatic deployement. $rstclr"

    echo -e "$cyn mkdir -p /home/vagrant/.ssh/ $rstclr"
    sleep 1
    mkdir -p /home/vagrant/.ssh/
    $done

    echo -e "$cyn wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub --directory-prefix=/home/vagrant/ --output-document=authorized_keys $rstclr"
    sleep 1
    wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub --directory-prefix=/home/vagrant/ --output-document=authorized_keys
    $done

    echo -e "$cyn mv /home/vagrant/authorized_keys /home/vagrant/.ssh/ $rstclr"
    sleep 1
    mv /home/vagrant/authorized_keys /home/vagrant/.ssh/
    $done

    echo -e "$cyn chmod 700 /home/vagrant/.ssh/ $rstclr"
    sleep 1
    chmod 700 /home/vagrant/.ssh/
    $done

    echo -e "$cyn chmod 600 /home/vagrant/.ssh/authorized_keys $rstclr"
    sleep 1
    chmod 600 /home/vagrant/.ssh/authorized_keys
    $done

    echo -e "$cyn chown vagrant:vagrant /home/vagrant/.ssh/ -R $rstclr"
    sleep 1
    chown vagrant:vagrant /home/vagrant/.ssh/ -R
    $done

    echo -e "$cyn apt-get clean $rstclr"
    sleep 1
    apt-get clean
    $done

    echo -e "$cyn apt-get autoclean $rstclr"
    sleep 1
    apt-get autoclean
    $done

    echo -e "$cyn apt-get autoremove $rstclr"
    sleep 1
    apt-get autoremove
    $done

    echo -e "$cyn passwd root $lghred (set it to vagrant) $rstclr"
    sleep 1
    passwd root
    $done
}

startup;
