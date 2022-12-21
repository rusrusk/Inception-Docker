FROM debian:buster

RUN apt update && apt install -y nginx


COPY index.html /var/www/html/index.html

# CMD ["nginx" "-g" "daemon off;"]
ENTRYPOINT nginx -g 'daemon off;'
# CMD bin/sh