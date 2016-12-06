#!/usr/bin/env sh

dname="taiga-celery"

start_container(){
    docker run --name $dname \
        --name taiga-celery -d \
        --link taiga-rabbit:rabbit \
        celery
}

start_container
if [ "$?" -eq 1 ]; then
    docker stop $dname
    docker rm $dname
    start_container
fi
