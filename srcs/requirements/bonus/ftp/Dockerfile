FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

RUN mkdir -p /var/run/vsftpd/empty && chown root:root /var/run/vsftpd/empty

COPY ./tools /

ENTRYPOINT ["/vsftpd.sh"]