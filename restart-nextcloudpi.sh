#!/bin/bash

directory=/home/pi/nextcloudpi-scripts
mount=/mnt

echo "-----------------------------------
Running nextcloudpi-restart script!
"

# Restart docker server if any
if [ "$(docker container ls -aq -f name=nextcloudpi -f status=exited)" ]; then
	if [ -d "$directory" ];then
		echo \* Removing old server.
		cd $directory
		docker-compose down
		echo \* Starting new server.
		docker-compose up -d
	else
		echo \* directory $directory not found!
	fi
else
	echo \* Nextcloudpi server already up, no action taken.
fi

# Mount a USB
if ! grep -qs "$mount" /proc/mounts; then
	echo \* Mounting USB on $mount
	sudo mount /dev/sda1 $mount
else
	echo \* USB already mounted or no USB found.
fi

echo "
Finished nextcloudpi-restart script!
-----------------------------------"
