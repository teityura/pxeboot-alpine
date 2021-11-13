#!/bin/sh

set -e

ln -s ../images/ /tftpboot/pxelinux/
ln -s ../images/ /tftpboot/uefi/

ls -al /tftpboot/pxelinux
ls -al /tftpboot/uefi

exit 0
