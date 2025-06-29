#!/bin/bash -x

DISK=/dev/sda
GENTOO=/mnt/$( ls /mnt )

ROOT=${DISK}4
BOOT=${DISK}1
EFI=${DISK}2
SWAP=${DISK}3

MOUNT=/usr/bin/mount
SWAPON=/usr/sbin/swapon

${MOUNT} ${ROOT} ${GENTOO}
${MOUNT} ${BOOT} ${GENTOO}/boot
${MOUNT} ${EFI} ${GENTOO}/boot/efi
${MOUNT} --bind /run ${GENTOO}/run
${MOUNT} --type proc /proc ${GENTOO}/proc
${MOUNT} --rbind /sys ${GENTOO}/sys
${MOUNT} --make-rslave ${GENTOO}/sys
${MOUNT} --rbind /dev ${GENTOO}/dev
${MOUNT} --make-rslave ${GENTOO}/dev
${SWAPON} ${SWAP}
