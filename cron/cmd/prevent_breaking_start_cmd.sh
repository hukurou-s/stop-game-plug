#! /bin/sh
docker run -d -e DEVICE_IP=$1 -e SLACK_WEBHOOK_URL=$2 --name prevent-breaking-container --rm prevent-breaking
