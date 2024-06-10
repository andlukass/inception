all:
	mkdir -p /home/llopes-d/data/frontend
	mkdir -p /home/llopes-d/data/database
	chmod -R 777 /home/llopes-d/data
	docker compose -f ./srcs/docker-compose.yml up -d

clean:
	rm -rf /home/llopes-d/data
	docker volume rm $(docker volume ls -q) || true
	docker network rm $(docker network ls -q) || true
	docker kill $$(docker ps -q) || true
	docker rm $$(docker ps -aq) || true

fclean: clean
	docker rmi $$(docker images -q) || true
	docker system prune -af

re: fclean
	rm -rf /home/llopes-d/data
	mkdir -p /home/llopes-d/data/frontend
	mkdir -p /home/llopes-d/data/database
	$(MAKE) all

stop:
	docker stop $$(docker ps -q) || true