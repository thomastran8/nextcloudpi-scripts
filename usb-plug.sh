#!/bin/bash

mount=/mnt

if ! grep -qs "$mount" /proc/mounts; then
	echo \* Mounting USB on $mount
	sleep 5
	sudo mount /dev/sdb1 $mount
else
	echo \* USB already mounted or no USB found.
fi
