 FROM ubuntu:22.04

 # Evitar perguntas interativas durante a instalação
 ENV DEBIAN_FRONTEND=noninteractive

 # Instalar dependências básicas
 RUN apt-get update && apt-get install -y \
     curl \
     bash \
     ca-certificates \
     && rm -rf /var/lib/apt/lists/*

 # Instalar o Clawdbot (OpenClaw) pelo script
 RUN curl -fsSL https://molt.bot/install.sh | bash

 # Comando padrão ao iniciar o container
 # Isso pode mudar depois se o comando for outro.
 CMD ["openclaw"]
