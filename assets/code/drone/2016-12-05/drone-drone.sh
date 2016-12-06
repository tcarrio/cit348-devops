start(){
    docker run \
        --volume /var/lib/drone:/var/lib/drone \
        --volume /var/run/docker.sock:/var/run/docker.sock \
        --env-file /etc/drone/dronerc \
        --restart=always \
        --publish=8181:8000 \
        --detach=true \
        --name=drone \
        --privileged \
        drone/drone:0.4
}

stop(){
    docker stop drone
    docker rm drone
}

case $1 in
    start)
        start
        ;;
    restart)
        stop
        start
        ;;
    stop)
        stop
        ;;
esac
