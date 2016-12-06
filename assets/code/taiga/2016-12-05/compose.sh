#!/usr/bin/env sh

source ./envs.sh

sh redis.sh
sh rabbit.sh
sh celery.sh
sh events.sh
sh taiga.sh
