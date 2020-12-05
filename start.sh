#! /bin/sh
docker build -t docker build -t stop-game-plug .
docker build -t cron ./cron/
docker run -v /var/run/docker.sock:/var/run/docker.sock -e DEVICE_IP=$1 cron
