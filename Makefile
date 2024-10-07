all:	vol
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
down:
	@docker-compose -f ./srcs/docker-compose.yml down

vol:
	mkdir -p ${HOME}/data/mysql
	mkdir -p ${HOME}/data/wordpress
	chmod -R 777 ${HOME}/data/
	chown -R $(USER) $(HOME)/data

#ELIMINAR FOLDERS DESDE TERMINAL Y BORRAR SUDO PARA PROBAR

clean:
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	@docker network rm inception;
	rm -rf /home/mcatalan/data/mysql/*
	rm -rf /home/mcatalan/data/wordpress/*

status:
	@docker ps

re: clean all

.PHONY: all down clean re status vol

