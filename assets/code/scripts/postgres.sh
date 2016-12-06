#!/usr/bin/env sh

#backup_dir="/opt/backups/postgres"
backup_dir="/opt/tom_backup/postgres"
run_date=$(date +"%Y-%m-%d")

for db in 'gogs' 'taiga' 'drone'; do
	mkdir -p "$backup_dir/$db"
	pg_dump -Z 9 -f "$backup_dir/$db/$run_date.sql.z9" $db
done
