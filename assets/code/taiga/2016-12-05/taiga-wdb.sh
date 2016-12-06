#!/usr/bin/env sh

dname="taiga-docker"

tcom=""

case $1 in
    regen)
        tcom="regenerate.sh";;
esac

start_container(){
    docker run -itd \
        -p 8080:80 \
        -e TAIGA_HOSTNAME=chase.ou.carrio.me \
        -e TAIGA_SECRET_KEY=y51zsOsV8MaOftMnd6iF \
        -e TAIGA_DB_NAME=taiga \
        -e TAIGA_DB_HOST=tom.ou.carrio.me \
        -e TAIGA_DB_USER=taiga \
        -e TAIGA_DB_PASSWORD=r7OUeKlQ \
        -v /opt/taiga-back/media:/usr/src/taiga-back/media \
        --link taiga-rabbit:rabbit \
        --link taiga-redis:redis \
        --link taiga-events:events \
        --name $dname \
        desertbit/taiga $tcom
}


start_container
if [ "$?" -eq 1 ]; then
    docker stop $dname
    docker rm $dname
    start_container
fi
