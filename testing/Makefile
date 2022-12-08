FIRST_RUNNING_CONTAINER = $(shell docker ps | grep -Eo "[a-z0-9]{12}")
ALL_IMAGES = $(shell docker images -a -q;)

all:
	docker-compose build



start:
	docker-compose up -d

stop:
	docker stop $(FIRST_RUNNING_CONTAINER)

delete_all:
	docker rmi -f $(ALL_IMAGES)