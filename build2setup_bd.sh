#!/bin/bash
set -x

modprobe ib_ipoib 

#git clone https://github.com/SymbioticLab/Infiniswap.git

#修改backup_disk="/dev/nvme0n1p4"

#100行的sudo去掉，docker里面没有这个

#vim ./setup/install.sh 

# echo 1 > portal.list
# echo 10.10.1.2:9400 >> portal.list

// fe80::1658:d0ff:fe58:4fb2

mkdir /mydata && /usr/local/etc/emulab/mkextrafs.pl /mydata

umount /dev/nvme0n1p4 && swapoff /dev/nvme0n1p3

cd /root/Infiniswap/setup

chmod +x *.sh &&  ./get_module.symvers.sh 3.3

./install.sh bd

./infiniswap_bd_setup.sh