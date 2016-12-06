
for d in taiga-events taiga-docker taiga-celery taiga-rabbit taiga-redis; do
    docker stop $d
    docker rm $d
done
