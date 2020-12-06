#! /bin/sh

if [ $# -ne 2 ]; then
    echo "実行時引数が2つ必要です" >&2
    echo "第一引数: device IP (例: 10.0.1.136)"
    echo "第二引数: Slack Webhook url (例: https://hooks.slack.com/services/XXXX/XXXXX)"
    exit 1
fi

docker build -t stop-game-plug ./stop/
docker build -t prevent-breaking ./prevent-breaking/
docker build -t cron ./cron/
docker run -v /var/run/docker.sock:/var/run/docker.sock -e DEVICE_IP=$1 -e SLACK_WEBHOOK_URL=$2 cron
