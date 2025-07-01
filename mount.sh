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

MOUNT=/usr/bin/mount
SWAPON=/usr/sbin/swapon

${MOUNT} ${ROOT} ${GENTOO}
${MOUNT} ${BOOT} ${GENTOO}/boot
if [ -n "${EFI}" ]; then
    ${MOUNT} ${EFI} ${GENTOO}/boot/efi
fi
${MOUNT} --bind /run ${GENTOO}/run
${MOUNT} --type proc /proc ${GENTOO}/proc
${MOUNT} --rbind /sys ${GENTOO}/sys
${MOUNT} --make-rslave ${GENTOO}/sys
${MOUNT} --rbind /dev ${GENTOO}/dev
${MOUNT} --make-rslave ${GENTOO}/dev
${SWAPON} ${SWAP}
