#!/usr/bin/env sh

dname="taiga-rabbit"

start_container(){
    docker run --name $dname \
        -d --hostname taiga rabbitmq:3 
}

start_container
if [ "$?" -eq 1 ]; then
    docker stop $dname
    docker rm $dname
    start_container
fi
