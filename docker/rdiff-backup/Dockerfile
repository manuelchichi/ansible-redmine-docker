FROM alpine:3.13.0

ENV CRON_SCHEDULE 0 0 * * *
ENV BACKUP_RETENTION 12M
ENV BACKUP_DIR /backup
ENV HOST_DIR /host

RUN apk --update add rdiff-backup

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

