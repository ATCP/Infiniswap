#!/bin/bash
set -x

modprobe ib_ipoib 

cd /root/Infiniswap/setup

./install.sh daemon


cd /root/Infiniswap/infiniswap_daemon

./infiniswap-daemon 10.10.1.2 9400