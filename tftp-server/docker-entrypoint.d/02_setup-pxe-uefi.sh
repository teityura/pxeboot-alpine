#!/bin/sh

set -e

#===============================================================================
# Extract BOOTIA32.EFI and BOOTX64.EFI from packages
#===============================================================================
mkdir -p /tftpboot/uefi

# Todo: ISOではなく、パッケージからブートローダを取り出す

# EFI IA32
cp /isos/centos-stream-release8/EFI/BOOT/BOOTIA32.EFI /tftpboot/uefi/
ls -al /tftpboot/uefi/BOOTIA32.EFI

# EFI BC
cp /isos/centos-stream-release8/EFI/BOOT/BOOTX64.EFI /tftpboot/uefi/
ls -al /tftpboot/uefi/BOOTX64.EFI

exit 0
