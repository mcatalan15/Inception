#all: up

#up:
#	@docker-compose -f ./srcs/requirements/docker-compose.yml up -d --build

#down:
#	@docker-compose -f ./srcs/requirements/docker-compose.yml down

#stop:
#	@docker-compose -f ./srcs/requirements/docker-compose.yml stop

#start:
#	@docker compose -f ./srcs/requirements/docker-compose.yml start

#clean:
#	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

#re:
#	@docker-compose -f ./srcs/requirements/docker-compose.yml build --no-cache

all:	vol
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
down:
	@docker-compose -f ./srcs/docker-compose.yml down

vol:
	sudo mkdir -p ${HOME}/data/mysql
	sudo mkdir -p ${HOME}/data/wordpress
	sudo chmod -R 777 ${HOME}/data/
	sudo chown -R $(USER) $(HOME)/data

clean:
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	#@docker network rm $$(docker network ls -q);
	@docker network rm inception;
	@sudo rm -rf /home/mcatalan/data/mysql/*
	@sudo rm -rf /home/mcatalan/data/wordpress/*

status:
	@docker ps

re: clean all

.PHONY: all down clean re status vol
