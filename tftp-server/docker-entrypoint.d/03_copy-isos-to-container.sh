#!/bin/sh

set -e

# CentOS Stream Release8
mkdir -p /tftpboot/images/centos-stream-release8
find /isos/centos-stream-release8/ -name '*vmlinuz*'
find /isos/centos-stream-release8/ -name '*initrd*'
cp /isos/centos-stream-release8/images/pxeboot/vmlinuz \
  /tftpboot/images/centos-stream-release8/vmlinuz
cp /isos/centos-stream-release8/images/pxeboot/initrd.img \
  /tftpboot/images/centos-stream-release8/initrd
chmod 755 /tftpboot/images/centos-stream-release8/vmlinuz
chmod 755 /tftpboot/images/centos-stream-release8/initrd
ls -al /tftpboot/images/centos-stream-release8/

exit 0
