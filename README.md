# nextcloudpi-docker-compose

This project aims at making the maintanance of a [NextCloudPi](https://github.com/nextcloud/nextcloudpi/) server easy, mainly by running it with Docker Compose.

The NextCloudPi project provides [Docker Run instructions](https://github.com/nextcloud/nextcloudpi#run-in-docker), which are translated into the docker-compose.yaml in this repository.

## Getting started

1. Configuration:

    - create `.env` file from example:

        ```bash
        cp .env.example .env
        ```

    - open `.env` and set the `DOMAIN` variable as required by your setup.

        For example, `DOMAIN=0.0.0.0` will make Nextcloud available at `localhost`.

2. Starting Docker container, depending on your CPU architecture:

    ```bash
    docker-compose up -d ncp-<armhf|x86>
    ```

3. Activation:

    Visit URL `https://$DOMAIN` (e.g. <https://localhost>) with your browser, and follow instructions.

## Maintenance scripts

Check out the `scripts/` folder, for utils to help you with maintenance.
