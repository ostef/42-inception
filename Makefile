DOCKER = sudo docker
COMPOSE = $(DOCKER) compose -p inception -f srcs/docker-compose.yml

all: up

ps:
	$(COMPOSE) ps

images:
	$(COMPOSE) images

volumes:
	$(DOCKER) volume ls

networks:
	$(DOCKER) network ls

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

up:
	$(COMPOSE) up --detach --build

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down --rmi all --volumes

fclean: clean
	sudo $(RM) -r /home/soumanso/data/mariadb/*
	sudo $(RM) -r /home/soumanso/data/wordpress/*

prune: down fclean
	$(DOCKER) system prune -a -f

re: fclean all

.PHONY: all ps images volumes networks start stop restart up down clean fclean prune re

