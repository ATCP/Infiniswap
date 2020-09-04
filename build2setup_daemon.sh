#!/bin/bash
set -x

apt-get install software-properties-common && add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update && apt-get install -y gcc-8 g++-8

cd /usr/bin && rm gcc g++
ln -sf gcc-8 gcc
ln -sf g++-8 g++



modprobe ib_ipoib 

cd /root/Infiniswap/setup

./install.sh daemon


cd /root/Infiniswap/infiniswap_daemon

./infiniswap-daemon 172.16.0.105 9400