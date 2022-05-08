#!/bin/bash

sudo cp restart-nextcloudpi.service /etc/systemd/system/
sudo systemctl enable restart-nextcloudpi.service
sudo systemctl start restart-nextcloudpi.service
