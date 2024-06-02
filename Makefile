all:
	mkdir -p /home/llopes-d/data/frontend
	mkdir -p /home/llopes-d/data/database
	docker compose -f ./srcs/docker-compose.yml up -d

clean:
	rm -rf /home/llopes-d/data
	docker kill $$(docker ps -q) || true
	docker rm $$(docker ps -aq) || true

fclean: clean
	docker rmi $$(docker images -q) || true

re: fclean
	rm -rf /home/llopes-d/data
	mkdir -p /home/llopes-d/data/frontend
	mkdir -p /home/llopes-d/data/database
	$(MAKE) all
