.PHONY: up down clean

up:
	mkdir -p /home/vcobbler/data
	mkdir -p /home/vcobbler/data/mariadb
	mkdir -p /home/vcobbler/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env build
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

down:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

clean: down
	docker rmi $(sudo docker images -qa)
	docker volume rm $(sudo docker volume ls -q)
	docker system prune -a --force
