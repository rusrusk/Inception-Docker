FIRST_RUNNING_CONTAINER = $(shell docker ps | grep -Eo "[a-z0-9]{12}")
ALL_IMAGES = $(shell docker images -a -q;)
IMAGE_ID_NGINX=$(shell docker container ls | grep nginx_html | cut -d" " -f1)

all:
	docker-compose build

start:
	docker-compose up 

stop:
	docker stop $(FIRST_RUNNING_CONTAINER)

delete_all:
	docker rmi -f $(ALL_IMAGES)


nginx_shell:
	docker exec -it $(IMAGE_ID_NGINX) /bin/sh