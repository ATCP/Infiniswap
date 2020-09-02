#!/bin/bash
set -x
cd /root
wget https://www.mellanox.com/downloads/ofed/MLNX_OFED-3.3-1.0.4.0/MLNX_OFED_LINUX-3.3-1.0.4.0-ubuntu14.04-x86_64.tgz
tar xvf MLNX_OFED_LINUX-3.3-1.0.4.0-ubuntu14.04-x86_64.tgz 
cd MLNX_OFED_LINUX-3.3-1.0.4.0-ubuntu14.04-x86_64
./mlnxofedinstall --force

# avoid host  lockup
echo 1 > /proc/sys/kernel/softlockup_panic

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