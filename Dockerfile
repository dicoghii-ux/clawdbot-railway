FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Baixa o script de instalação, mas NÃO roda no build
RUN curl -fsSL https://molt.bot/install.sh -o /tmp/install.sh \
    && chmod +x /tmp/install.sh

# Script de inicialização: instala (se ainda não instalado) e inicia o OpenClaw
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
