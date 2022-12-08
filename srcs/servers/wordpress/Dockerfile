# The <FROM> instruction initializes a new buil stage and sets the "Base image" for subsequent instructions.
# It will pull debian:buster image to our local machine and then build our custom image
FROM debian:buster

# The <RUN> instruction will execute any commands in a new layer on top of the currebnt image and commit the results.
# The resulting committed image will be used for the next step in Dockerfile
# Installs tools required for project
# NGINX must rely on separate PHP processor to handle PHP requests. This processing is handled with [php.fpm]
# a PHP processor that has been extensively tested to work with NGINX
RUN apt update
RUN apt install -y php7.3 php-mysqli php-fpm curl
RUN chmod 777 /var/www/launch.sh

#COPY [--chown=<user>:<group>] <src>... <dest>
#The <COPY> instruction copies new files or directories from <src> and adds them to filesystem of the container at the path<dest>
# Php-fpm service creates a default pool, the config-ion (www.conf) for which can be found in /etc/php/7.3/fpm/pool.d folder
#
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
#www where is commoin location for webpage file
COPY ./tools /var/www/


# # We copy our index.html file into the /var/www/index.html. Static website
# COPY ./conf/index.html /var/www/index.html

#<EXPOSE> instruction indicates the ports on which a container listens for conntections.
#We should use traditional port for our application
EXPOSE 9000

#<CMD> instruction should be used to run software contained in the image, along with any arguments.
#The main purpose is to provide defaults for an executing container.
CMD /var/www/launch.sh