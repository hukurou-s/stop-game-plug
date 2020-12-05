#! /bin/sh
docker build -t cron .
docker run -v /var/run/docker.sock:/var/run/docker.sock -e DEVICE_IP=$1 cron
