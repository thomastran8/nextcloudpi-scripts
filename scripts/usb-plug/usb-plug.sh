#!/bin/bash

mount=/mnt
usb_device=$(lsblk | grep -o 'sd.[^ ]')

sudo umount $mount
if ! mountpoint -q /mnt; then
	echo \* Mounting USB on $mount...
	sudo mount /dev/$usb_device $mount
	echo \* Mounted!
else
	echo \* USB already mounted or no USB found.
fi
