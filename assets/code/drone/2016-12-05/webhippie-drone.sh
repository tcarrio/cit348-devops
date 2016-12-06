start(){
    docker run \
        --volume /var/lib/drone:/var/lib/drone \
        --volume /var/run/docker.sock:/var/run/docker.sock \
	--env DATABASE_DRIVER=postgres \
	--env DRONE_POSTGRES_HOST="tom.ou.carrio.me:5432" \
	--env DRONE_POSTGRES_USERNAME=drone \
	--env DRONE_POSTGRES_PASSWORD=r7OUeKlQ \
	--env DRONE_POSTGRES_DATABASE=drone \
	--env DRONE_GOGS_URL=http://tom.ou.carrio.me \
	--env DRONE_GOGS_GIT_USERNAME=root \
	--env DRONE_GOGS_GIT_PASSWORD=x6iCXFqF \
	--env DRONE_SERVER="http://127.0.0.1:8000" \
	--env DRONE_ADMIN=root \
	--env REMOTE_DRIVER=gogs \
	--env REMOTE_CONFIG="http://tom.ou.carrio.me?open=true&skip_verify=true" \
        --restart=always \
        --publish=80:8000 \
        --detach=true \
        --name=drone \
        --privileged \
        webhippie/drone:latest
}

case $1 in
    start)
        start
        ;;
    restart)
        docker stop drone
        docker rm drone
        start
        ;;
    stop)
        docker stop drone
        ;;
esac
