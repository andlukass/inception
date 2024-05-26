FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

RUN rm -rf /etc/nginx/nginx.conf

COPY ./tools/nginx.conf /etc/nginx/
COPY ./tools/ssl /etc/nginx/ssl/

EXPOSE 443

CMD ["nginx"]
