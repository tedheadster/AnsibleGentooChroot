#!/bin/bash -x

GENTOO=/mnt/$( ls /mnt )
UNAME=$( /usr/bin/uname -m )

case "${UNAME}" in

    aarch64)
	DISK="/dev/sda"
	ROOT=${DISK}4
	BOOT=${DISK}2
	SWAP=${DISK}3
	EFI=${DISK}1
	;;

    i686)
	DISK="/dev/sdb"
	ROOT=${DISK}3
	BOOT=${DISK}1
	SWAP=${DISK}2
	EFI=""
	;;

    x86_64)
	DISK="/dev/sdb"
	ROOT=${DISK}3
	BOOT=${DISK}1
	SWAP=${DISK}2
	EFI=""
	;;

    *)
	;;
esac

UMOUNT=/usr/bin/umount
SWAPOFF=/usr/sbin/swapoff

${SWAPOFF} ${SWAP}
${UMOUNT} -R ${GENTOO}/dev
${UMOUNT} -R ${GENTOO}/sys
${UMOUNT} -R ${GENTOO}/proc
${UMOUNT} -R ${GENTOO}/run
if [ -n "${EFI}" ]; then
    ${UMOUNT} -R ${GENTOO}/boot/efi
fi
${UMOUNT} -R ${GENTOO}/boot
${UMOUNT} -R ${GENTOO}
