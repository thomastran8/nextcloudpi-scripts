#!/bin/bash

mount=/mnt

if grep -qs "$mount" /proc/mounts; then
	sudo rsync -a --delete /var/lib/docker/volumes/nextcloudpi-scripts_ncdata/_data/app/data/ncp/files/ /mnt
fi
