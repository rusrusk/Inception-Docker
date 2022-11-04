# The <FROM> instruction initializes a new buil stage and sets the "Base image" for subsequent instructions.
FROM debian:buster

# The <RUN> instruction will execute any commands in a new layer on top of the currebnt image and commit the results.
# The resulting committed image will be used for the next step in Dockerfile
# Installs tools required for project
RUN apt update
RUN apt install -y mariadb-server

#COPY [--chown=<user>:<group>] <src>... <dest>
#The <COPY> instruction copies new files or directories from <src> and adds them to filesystem of the container at the path<dest>
