#!/usr/bin/env sh

dname="taiga-events"

start_container(){
    docker run \
        --name taiga-events -d \
        --link taiga-rabbit:rabbit \
        benhutchins/taiga-events 
}

start_container
if [ "$?" -eq 1 ]; then
    docker stop $dname
    docker rm $dname
    start_container
fi
