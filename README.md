# INCEPTION
Project to start in the world of containers!

## HELPER GUIDE
I created this file during inception, it helped me organize my thoughts, besides having something to check certain commands, feel free to use it too!

### extras
Do the VM within an ubuntu machine, there way less compability errors, and tutorials in the internet. The subject says you need the images to be debian or alpine, nothing about the VM, so feel free to choose the system you want to.

INSTALL SSH (TO USE ON YOUR NORMAL PC)
change the network confg on you Virtual Box to brigde

apt install openssh-server

check your ip with: "ip a" // usually its the one starting with 10.***
in your real computer you can log ssh with: "ssh <your_user>@<VM_ipadress> -p 22"
you can also install a extention on your vscode (Remore - SSH) to connect in your VM trough vscode, so you can edit your files easier

install git so you can keep your containers safe and portable
apt install git
dont forget to add the ssh key to your github

	ssh-keygen -t ed25519 -C "your_email@example.com"

### 1. install build esssentials
make sure you have installed build essentials so you can run make command:

	apt-get install build-essential

### 2. install docker engine:
follow the official steps to install docker:

https://docs.docker.com/engine/install/ubuntu/

### 3. create the docker image with nginx
create a key and certificate so we can use ssl(tsl1.2) on our server 

with the following command: //this is the gren locker in the website url

	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.key -out cert.crt
 
we will keep this two files in the srcs/requirements/nginx/tools/ssl so we can copy it in the dockerfile

now with the correct dockerfile and conf, it should be done!

we can run the image and from our host access following url to test it:

	https://localhost:443

you can test if the tls1.2 separately by runnning:

	openssl s_client -connect <IP_ADRESS>:<SSL_PORT> -tls1_2

### 4. create the docker image with mariadb
create a directory /home/<YOR_LOGIN>/data/database
it ill be used as the mariadb data directory
we will need to do a script that install the database in the dir we want and create a user to access the database outside localhost, and after start the mariadb in safe mode passing the default user mysql, the path to the wanted DB and with the bind command to ensure we can acess it form outside
now with the correct dockerfile, it should be done!
install mariadb server on your host, so we can test it

	apt-get update -y && apt-get install mariadb-server -y
now we can run from our host the following comand to test it:

	mysql -u <sql_login> -h <container_ip> -P 3306 -p123

### 5. create the docker image with wordpress
create a directory /home/<YOR_LOGIN>/data/frontend
it ill be used as the wordpress files directory
install php, install wp-cli so we can config wordpress by terminal.
make it listen to port 9000.
if it is the first run, download de wordpress files, create the config file, run the installation of wordpress, to configure the initial settings and connect with mariadb, create the extra user, download and install the redis plugin, and then run the php server.

### 6. change hosts file to accept connections via <login>.42.fr
	echo "127.0.0.1 <login>.42.fr" >> /etc/hosts

## BONUS 
### 1. adminer
its a admin page that connect with the sql container, its just a dockerfile with php and serving a file, that we can access and login in our database.
just download the adminer files and run php on the rigth dir

### 2. ftp
its a way to access the wordpress dir from any computer, we just need a dockerfile with ftp and copy our script that create a new user so we can access it from outside, and
add the dir we want it to redirect to the default conf file

### 3. monstaftp
its a grafic interface to ftp
just download the monstaftp files and run php on the rigth dir(need to change the max_upload on the php.ini)

### 4. redis
its a way to cache the response of fastcgi to have a server economy
install redis, run it. you must configure the host and port at wordpress config file


## NICE COMMANDS
### NETWORK CHECKS
install ping

	apt-get update && apt-get install iputils-ping -y

list active ports

	ss -tuln 

list all docker networks

	docker network ls

list all containers inside the network

	docker inspect <network_name>

### DOCKER COMMANDS
remove all the containers and images, and start from scratch

	docker kill $(docker ps -q); docker rm $(docker ps -aq)
	docker rmi $(docker images -q)
 	docker system prune -af

### IMAGE RELATED COMMANDS
build a docker image manually

	docker build -t <any_name>:latest <Dockerfile_Dir>
list docker images

	docker images

remove docker images

	docker rmi <IMAGE_ID>

### CONTAINER RELATED COMMANDS
run a container from a image, the '-d' makes it run in background, so it doest freeze your terminal

	docker run -d  <IMAGE_ID>

 list all containers ('-a' list even stopped containers)
 
	docker ps -a

 enter into a running container
 
	docker exec -it <container> bash

 stop a container
 
	docker stop  <CONTAINER_ID>

 remove a container:
 
 	docker rm  <CONTAINER_ID>
