# Usar a imagem oficial do Debian Bullseye como base
FROM debian:bullseye

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Baixar e instalar o Portainer
RUN curl -L https://downloads.portainer.io/portainer-ce/portainer-ce-linux-amd64.tar.gz -o /tmp/portainer.tar.gz \
    && tar xzf /tmp/portainer.tar.gz -C /tmp \
    && mv /tmp/portainer-* /portainer \
    && rm /tmp/portainer.tar.gz

# Expor a porta necessária
EXPOSE 9000

# Definir o diretório de trabalho
WORKDIR /portainer

# Definir o comando de inicialização
CMD ["./portainer"]
