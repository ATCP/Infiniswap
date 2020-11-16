#!/bin/bash
set -x


mkdir /root/build && cd /root/build

# wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4-wily/linux-headers-4.4.0-040400_4.4.0-040400.201601101930_all.deb https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4-wily/linux-headers-4.4.0-040400-generic_4.4.0-040400.201601101930_amd64.deb https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4-wily/linux-image-4.4.0-040400-generic_4.4.0-040400.201601101930_amd64.deb

wget https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.11/linux-headers-4.11.0-041100_4.11.0-041100.201705041534_all.deb https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.11/linux-headers-4.11.0-041100-generic_4.11.0-041100.201705041534_amd64.deb  https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.11/linux-image-4.11.0-041100-generic_4.11.0-041100.201705041534_amd64.deb

dpkg -i *.deb

update-grub
