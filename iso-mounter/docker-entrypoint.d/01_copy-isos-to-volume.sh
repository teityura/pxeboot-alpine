#!/bin/sh

set -e

mkdir -p /mnt/iso
mkdir -p ~/src
cd ~/src/

# CentOS Stream Release8 20211109
if [ ! -e '/isos/centos-stream-release8/.treeinfo' ]; then
    echo 'not exist: centos-stream-release8'
    wget http://ftp.iij.ad.jp/pub/linux/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-20211109-dvd1.iso
    mount -t iso9660 -o loop,ro CentOS-Stream-8-x86_64-20211109-dvd1.iso /mnt/iso
    mkdir -p /isos/centos-stream-release8
    cp -r /mnt/iso/. /isos/centos-stream-release8/
    ls -al /isos/centos-stream-release8/
    umount /mnt/iso/
else
    echo 'exist: centos-stream-release8'
fi
ls -al /isos/centos-stream-release8/

exit 0
