docker container ls # display running containers
docker images # see all images
docker stop [container_name] # stop container
docker stop $(docker images -a -q)
docker rmi -f $(docker images -a -q) # delete all containers
docker exec -it [container_name] /bin/sh # get into running containers environment
docker-compose down --volumes # docker switch off volumes
docker volume ls # list volumes



ab04789c9ff4