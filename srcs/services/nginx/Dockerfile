#specifies the parent image
FROM debian:buster

# The <RUN> instruction will execute any commands in a new layer on top of the current image and commit the results.
# The resulting committed image will be used for the next step in Dockerfile
# Installs tools required for project
RUN apt update && apt install -y nginx openssl
# RUN chmod 777 /var/www/launch.sh


#COPY <src>... <dest>
#The <COPY> instruction copies new files or directories from <src> and adds them to filesystem of the container at the path<dest>
#sites-available(sites-enabled) contains nginx config files for each of our sites.
#they permit easily work with multiple sites and hosts on my local machine 
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY ./tools /var/www

#<EXPOSE> instruction indicates the ports on which a container listens for conntections.
#We should use traditional port for our application
EXPOSE 443

#<CMD> instruction should be used to run software contained in the image, along with any arguments.
#The main purpose is to provide defaults for an executing container.
CMD bash /var/www/launch.sh
