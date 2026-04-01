#!/bin/bash

DATE=$(date +"%Y-%m-%d")
BACKUP_DIR="/backup/mysql"

mkdir -p $BACKUP_DIR

mysqldump -u root -p'12233443dsf' --all-databases > $BACKUP_DIR/db_$DATE.sql

gzip $BACKUP_DIR/db_$DATE.sql

find $BACKUP_DIR -type f -mtime +7 -delete

echo "Backup completed on $DATE" >> $BACKUP_DIR/backup.log
