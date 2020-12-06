#! /bin/sh
docker run -d -e DEVICE_IP=$1 --name prevent-breaking-container --rm prevent-breaking
