FROM docker

RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

COPY root /var/spool/cron/crontabs/root
COPY ./cmd/*_cmd.sh /bin/

RUN chmod +x /bin/stop_game_plug_cmd.sh
RUN chmod +x /bin/prevent_breaking_start_cmd.sh
RUN chmod +x /bin/prevent_breaking_stop_cmd.sh

CMD ["crond", "-f", "-l", "8"]
