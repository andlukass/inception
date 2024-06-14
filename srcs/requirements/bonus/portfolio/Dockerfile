FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx unzip

COPY /tools /var/www

WORKDIR /var/www

RUN rm -rf /var/www/html
RUN unzip /var/www/html.zip
RUN rm -rf /var/www/html.zip

ENTRYPOINT ["nginx", "-g", "daemon off;"]