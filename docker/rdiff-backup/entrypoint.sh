#!/bin/sh

printf "$CRON_SCHEDULE rdiff-backup $MOUNTED_VOLUME $BACKUP_DIR\n$CRON_SCHEDULE rdiff-backup --remove-older-than $BACKUP_RETENTION $BACKUP_DIR" | crontab -

# Start the cron daemon
exec crond -f
