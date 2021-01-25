FROM python:3.9.1-alpine

ENV CRON_SCHEDULE 0 0 * * *
ENV BACKUP_RETENTION 12M
ENV MOUNTED_VOLUME /volume
ENV BACKUP_DIR /backup

RUN apk --update add gcc musl-dev librsync-dev

RUN pip3 install rdiff-backup

COPY entrypoint.sh /entrypoint.sh
RUN chmod 744 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

