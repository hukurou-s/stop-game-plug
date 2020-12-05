FROM docker

COPY root /var/spool/cron/crontabs/root
COPY ./cron_cmd.sh /bin/cron_cmd.sh

RUN chmod +x /bin/cron_cmd.sh

CMD ["crond", "-f", "-l", "8"]
