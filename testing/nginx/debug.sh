docker run \
    --rm \
    -p80:80 \
    -p443:443 \
    -v code:/var/www/html\
    --name="experiment_nginx" \
    experiment_nginx