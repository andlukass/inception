all:
	docker-compose -f ./srcs/docker-compose.yml up -d

clean:
	docker kill $$(docker ps -q); docker rm $$(docker ps -aq)

fclean: clean
	docker rmi $$(docker images -q)

re: clean
	rm -rf /home/llopes-d/data
	mkdir -p /home/llopes-d/data/frontend
	mkdir -p /home/llopes-d/data/database
	$(MAKE) all
