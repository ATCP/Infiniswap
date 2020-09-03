#!/bin/bash
set -x

modprobe ib_ipoib 

cd /root/Infiniswap/setup

./install.sh daemon


cd /root/Infiniswap/infiniswap_daemon

./infiniswap-daemon 172.16.0.105 9400