#!/bin/sh

set -e

#===============================================================================
# Extract pxelinux.0 from syslinux
#===============================================================================
mkdir -p /tftpboot/pxelinux

cp /usr/share/syslinux/pxelinux.0 /tftpboot/pxelinux/
ls -al /tftpboot/pxelinux/pxelinux.0

cp /usr/share/syslinux/vesamenu.c32 /tftpboot/pxelinux/
cp /usr/share/syslinux/ldlinux.c32 /tftpboot/pxelinux/
cp /usr/share/syslinux/libcom32.c32 /tftpboot/pxelinux/
cp /usr/share/syslinux/libutil.c32 /tftpboot/pxelinux/
cp /usr/share/syslinux/reboot.c32 /tftpboot/pxelinux/
ls -al /tftpboot/pxelinux/

exit 0
