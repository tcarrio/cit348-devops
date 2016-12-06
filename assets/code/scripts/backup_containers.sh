#!/usr/bin/env sh

taiga_backup="/opt/chase_backup/taiga"
drone_backup="/opt/chase_backup/drone"
run_date=$(date +"%Y-%m-%d")

taiga_dir="/home/cwehlert/docker-scripts/full_taiga"
drone_dir="/home/cwehlert/docker-scripts/drone"

mkdir -p $taiga_backup/$run_date
mkdir -p $drone_backup/$run_date

cp $taiga_dir/* $taiga_backup/$run_date/
cp $drone_dir/* $drone_backup/$run_date/


