#!/bin/bash
set -x

apt-get install software-properties-common
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-8 g++-8

cd /usr/bin
rm gcc g++
ln -sf gcc-8 gcc
ln -sf g++-8 g++


modprobe ib_ipoib 

#git clone https://github.com/SymbioticLab/Infiniswap.git

#修改backup_disk="/dev/nvme0n1p4"

#100行的sudo去掉，docker里面没有这个

#vim ./setup/install.sh 

# echo 1 > portal.list
# echo 10.10.1.2:9400 >> portal.list

// fe80::1658:d0ff:fe58:4fb2

mkdir /mydata && /usr/local/etc/emulab/mkextrafs.pl /mydata

umount /dev/sda4 && swapoff /dev/sda3

cd /root/Infiniswap/setup

chmod +x *.sh &&  ./get_module.symvers.sh 3.3

./install.sh bd

./infiniswap_bd_setup.sh