FROM debian:buster

RUN apt update; apt install -y nginx

COPY conf/nginx.conf /etc/nginx/conf/nginx.conf

CMD ["nginx", "-g", "daemon off;"]