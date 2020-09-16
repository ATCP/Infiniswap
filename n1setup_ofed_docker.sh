#!/bin/bash
set -x

cd /root
wget https://www.mellanox.com/downloads/ofed/MLNX_OFED-3.3-1.0.4.0/MLNX_OFED_LINUX-3.3-1.0.4.0-ubuntu14.04-x86_64.tgz
tar xvf MLNX_OFED_LINUX-3.3-1.0.4.0-ubuntu14.04-x86_64.tgz 
cd MLNX_OFED_LINUX-3.3-1.0.4.0-ubuntu14.04-x86_64
# wget http://content.mellanox.com/ofed/MLNX_OFED-4.1-1.0.2.0/MLNX_OFED_LINUX-4.1-1.0.2.0-ubuntu14.04-x86_64.tgz
# tar xvf MLNX_OFED_LINUX-4.1-1.0.2.0-ubuntu14.04-x86_64.tgz
# cd MLNX_OFED_LINUX-4.1-1.0.2.0-ubuntu14.04-x86_64

./mlnxofedinstall --force  --without-fw-update


# install docker
apt-get install -y \
 apt-transport-https \
 ca-certificates \
 curl \
 gnupg-agent \
 software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

#apt-cache madison docker-ce

apt-get update
apt-get install -y docker-ce=17.06.0~ce-0~ubuntu
# apt-get install -y docker-ce=18.06.3~ce~3-0~ubuntu
cd /root/Infiniswap

chmod +x *.sh */*.sh infiniswap_bd/nbdxadm/*


# avoid host  lockup
# echo 1 > /proc/sys/kernel/softlockup_panic


#vim /etc/network/interfaces

echo 1 > /proc/sys/kernel/softlockup_panic

echo "auto ib0
iface ib0 inet static
address 172.16.0.105
netmask 255.255.255.0
broadcast 172.16.0.255 " >> /etc/network/interfaces