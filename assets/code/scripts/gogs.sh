#!/usr/bin/env sh
backup_dir="/opt/tom_backup/gogs/"
run_date=$(date +"%Y-%m-%d")
mkdir -p $backup_dir/$run_date/
cp /opt/gogs/custom/conf/app.ini $backup_dir/$run_date/app.ini
