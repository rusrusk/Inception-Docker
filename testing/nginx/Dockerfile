FROM debian:buster

RUN apt update; apt install -y nginx


COPY conf/nginx.conf /etc/nginx/conf/nginx.conf

COPY ./tools/launch.sh /var/www

CMD bash /var/www/launch.sh