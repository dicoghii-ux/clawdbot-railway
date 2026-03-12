FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Copia o entrypoint ANTES de qualquer coisa
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Baixa o script de instalação mas NÃO roda no build
RUN curl -fsSL https://molt.bot/install.sh -o /tmp/install.sh \
    && chmod +x /tmp/install.sh

ENTRYPOINT ["/entrypoint.sh"]
