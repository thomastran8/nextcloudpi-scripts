# nextcloudpi-docker-compose

This project aims at making the maintanance of a [NextCloudPi](https://github.com/nextcloud/nextcloudpi/) server easy, mainly by running it with Docker Compose.

The NextCloudPi project provides [Docker Run instructions](https://github.com/nextcloud/nextcloudpi#run-in-docker), which are translated into the docker-compose.yaml in this repository.

## Getting started

1. Clone the repository to raspberry pi's home
    > Maintenance script directory paths are hardcoded to the pi's home
    
    ```
    cd /home/pi
    git clone https://github.com/thomastran8/nextcloudpi-scripts.git
    ```

2. Configuration:

    - create `.env` file from example:

        ```bash
        cp .env.example .env
        ```

    - open `.env` and set the `DOMAIN` variable as required by your setup.

        For example, `DOMAIN=0.0.0.0` will make Nextcloud available at `localhost`.

3. Starting Docker container, depending on your CPU architecture:

    ```bash
    docker-compose up -d ncp-<armhf|x86>
    ```

4. Activation:

    Visit URL `https://$DOMAIN` (e.g. <https://localhost>) with your browser, and follow instructions.

## Maintenance scripts

Check out the `scripts/` folder, for utils to help you with maintenance.

- Enable automatic usb mounting to `/mnt` (For hot-plugging a usb-drive as a backup):

    ```
    cd scripts/usb-plug/
    ./setup.sh
    ```

- Enable daily automatic data backup at midnight to `/mnt` (usb-drive):

    > In cases where your SD card fails, this is a good local backup.
    ```
    cd scripts/backup/
    nano crontab.txt
    <copy contents>
    crontab -e
    <paste contents>
    ```

- Enable automatic restart on boot:

    > In cases where you need to reboot the raspberry pi, the docker container should come back up.
    ```
    cd scripts/restart-nextcloudpi
    ./setup.sh
    ```