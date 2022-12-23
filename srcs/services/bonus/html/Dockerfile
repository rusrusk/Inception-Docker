FROM debian:buster

RUN apt update && apt install -y nginx

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

COPY ./conf/index.html /var/www/html/

CMD ["nginx", "-g", "daemon off;"]