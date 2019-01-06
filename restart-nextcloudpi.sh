#!/bin/bash

directory=/home/pi/nextcloudpi-scripts

# Wait for docker daemon
sleep 20

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

echo "
Finished nextcloudpi-restart script!
-----------------------------------"

