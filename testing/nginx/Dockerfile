FROM debian:buster

RUN apt update && apt install -y nginx


# WORKDIR /home/rkultaev/Inception/testing/nginx/conf.d

# COPY ./conf.d/nginx.conf /etc/nginx/conf.d/nginx.conf

ADD conf.d/nginx.conf /etc/nginx/conf.d