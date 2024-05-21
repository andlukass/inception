FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd && \
   rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty && chown root:root /var/run/vsftpd/empty

COPY ./tools /

EXPOSE 21

CMD ["./vsftpd.sh"]
