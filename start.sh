#! /bin/sh
docker build -t stop-game-plug ./stop/
docker build -t prevent-breaking ./prevent-breaking/
docker build -t cron ./cron/
docker run -v /var/run/docker.sock:/var/run/docker.sock -e DEVICE_IP=$1 cron
