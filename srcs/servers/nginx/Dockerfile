# The <FROM> instruction initializes a new buil stage and sets the "Base image" for subsequent instructions.
# It will pull debian:buster image to our local machine and then build our custom image
FROM debian:buster

# The <RUN> instruction will execute any commands in a new layer on top of the currebnt image and commit the results.
# The resulting committed image will be used for the next step in Dockerfile
# Installs tools required for project
RUN apt update
RUN apt install -y nginx openssl
RUN chmod 777 /var/www/launch.sh

#<EXPOSE> instruction indicates the ports on which a container listens for conntections.
#We should use traditional port for our application
EXPOSE 443

#COPY [--chown=<user>:<group>] <src>... <dest>
#The <COPY> instruction copies new files or directories from <src> and adds them to filesystem of the container at the path<dest>
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY ./tools/launch.sh /var/www


#<CMD> instruction should be used to run software contained in the image, along with any arguments.
#The main purpose is to provide defaults for an executing container.
CMD /var/www/launch.sh
