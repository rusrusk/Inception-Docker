docker run \
    --rm \
    -p80:80 \
    -p443:443 \
    -v code:/var/www/html\
    --name="experiment_nginx" \
    experiment_nginx


#--rm	tells Docker to clean up when the container exits, removing container and filesystem for the container.
#-p		tells Docker to map port 80 from container to port 80 on the host.
#-v		switched mounts volumes in the container. A volume can be a dir of a file on the host, a named volume that Docker manages for me.
		#if i want to stop and restart container and retain data that is written to the filesystem by container, we must mount volume and container must write to this volume.