FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

COPY ./conf/nginx.conf /etc/nginx/
COPY ./tools/ssl /etc/nginx/ssl/

CMD ["nginx"]