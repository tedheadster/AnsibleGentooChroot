#!/bin/bash -x

DISK=/dev/sda
GENTOO=/mnt/$( ls /mnt )

ROOT=${DISK}4
BOOT=${DISK}1
EFI=${DISK}2
SWAP=${DISK}3

UMOUNT=/usr/bin/umount
SWAPOFF=/usr/sbin/swapoff

${UMOUNT} -R ${GENTOO}/proc
${UMOUNT} -R ${GENTOO}/sys
${UMOUNT} -R ${GENTOO}/dev
${UMOUNT} -R ${GENTOO}/boot/efi
${UMOUNT} -R ${GENTOO}/boot
${UMOUNT} -R ${GENTOO}
${SWAPOFF} ${SWAP}
