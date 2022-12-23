COMPOSE_FILE			=			srcs/docker-compose.yml

all	: build

build :
			@echo "$(YELLOW)Building files for volumes ... $(RESET)"
			@mkdir -p /home/${USER}/data/db/
			@mkdir -p /home/${USER}/data/wp/
			@echo "$(YELLOW) Building containers ... $(RESET)"
			@docker-compose -f $(COMPOSE_FILE) up --build
			@echo "$(GREEN) Containers have been successfully built! $(RESET)"


detach :
			@echo "$(YELLOW) Building files for volumes ... $(RESET)"
			@mkdir -p /home/${USER}/data/db/
			@mkdir -p /home/${USER}/data/wp/
			@echo "$(YELLOW) Building containers in the background ... $(RESET)"
			@docker-compose -f $(COMPOSE_FILE) up -d --build
			@echo "$(GREEN) Containers have been successfully built in the background! $(RESET)"

#We can launch our containers utilizing command <docker-compose up>,
#that will create and invoke our containers and dependencies in order.
#We create containers using commands <docker-compose up> and flag "-d",
#that will launch mariadb, wordpress and nginx


#start and restart all the services defined in yml file
up	:

			@docker-compose -f $(COMPOSE_FILE) up -d --build
			@echo "$(GREEN) Services are running! $(RESET)"

#<docker-compose down> will stop running containers, but also will remove stopped containers and
#any networks that were created. 
down :
			@docker-compose -f $(COMPOSE_FILE) down --volumes

#only to restart all the services that were previously created but were stopped.
start :
			@docker-compose -f $(COMPOSE_FILE) start

#command will stop running containers but won't remove them
stop :
			@docker-compose -f $(COMPOSE_FILE) stop
			@echo "$(GREEN) Services are stopped! $(RESET)"


#The list of containers
ps :
			@docker-compose -f $(COMPOSE_FILE) ps

#Shows information logged by running containers
logs :
			#docker-compose -f $(COMPOSE_FILE) logs

# Now we should clean all the artifacts. We define it as stopping all the containers for the project, and finally
# deleting all the images for the project. This would require Docker to rebuild everything from scratch upon next startup.
# <prune> cleans up stopped copntainers, unused networks, dangling images, build cache
# I add '-a' flag to clean up all images, not just dangling ones(that are not tagged on the system,
# Dang point are created when we build a Docker image with the same tag again and again. In this case Docker
# will move the tag to the latest image resulting from build and all previous images will have no tag
fclean : down
			@echo "$(RED)Deleting all images...$(RESET)"
			@docker rmi -f $$(docker images -qa);\
			docker system prune -a --force
			sudo rm -Rf /home/rkultaev/data/db
			sudo rm -Rf /home/rkultaev/data/wp
			@echo "$(RED)Cleaning up everything...$(RESET)"



#Recreation and reset the services
re : 
			docker-compose -f $(COMPOSE_FILE) up -d --build


#run .PHONY for commands that do not represent physical files in the file system
.PHONY : all up down ps fclean re


RESET		:= \033[0m
B_RED		:= \033[1;31m
RED 		:= \033[0;31m
B_GREEN		:= \033[1;32m
GREEN 		:= \033[0;32m
B_BLUE 		:= \033[1;34m
BLUE 		:= \033[0;34m
PURPLE		:= \033[0;35m
B_PURPLE	:= \033[1;35m
YELLOW 		:= \033[1;33m