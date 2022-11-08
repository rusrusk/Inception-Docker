all			:			up

# COMPOSE_FILE				=			srcs/docker-compose.yml			
# DOCKER_COMPOSE			=			docker-compose

#We can launch our containers utilizing command <docker-compose up>,
#that will create and invoke our containers and dependencies in order.
#We create containers using commands <docker-compose up> and flag "-d",
#that will launch mariadb, wordpress and nginx


#Starts and defines all the services defines in docker-compose.yml in "detached" mode (-d)
#Compose exits after starting the containers, but the containers continue to run the background.
up	:		
			@mkdir -p /home/${USER}/data/db
			@mkdir -p /home/${USER}/data/db
			@docker-compose -f srcs/docker-compose.yml up -d --build


#<docker-compose down> will stop running containers, but also will remove stopped containers and
#any networks that were created. 
down :
			@docker-compose -f srcs/docker-compose.yml down

#The list of containers
ps :
			@docker-compose -f srcs/docker-compose.yml ps

# Now we should clean all the artifacts. We define it as stopping all the containers for the project, and finally
# deleting all the images for the project. This would require Docker to rebuild everything from scratch upon next startup.
# <prune> cleans up stopped copntainers, unused networks, dangling images, build cache
# I add '-a' flag to clean up all images, not just dangling ones(that are not tagged on the system,
# Dang point are created when we build a Docker image with the same tag again and again. In this case Docker
# will move the tag to the latest image resulting from build and all previous images will have no tag
fclean : down
			@docker rmi -f $$(docker images -qa);\
			docker volume rm $$(docker volume ls -q);\
			docker system prune -a --force
			sudo rm -Rf /home/rkultaev/data/db
			sudo rm -Rf /home/rkultaev/data/wp
			mkdir /home/rkultaev/data/db
			mkdir /home/rkultaev/data/wp


#Recreation and reset the services
re : fclean up


#run .PHONY for commands that do not represent physical files in the file system
# .PHONY : all up down ps fclean re


						