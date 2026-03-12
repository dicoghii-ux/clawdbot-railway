#!/usr/bin/env bash
set -e

# instala o OpenClaw se ainda não estiver instalado
if ! command -v openclaw >/dev/null 2>&1; then
  echo "OpenClaw não encontrado, executando instalador..."
  /tmp/install.sh || {
    echo "Falha ao instalar OpenClaw"
    exit 1
  }
fi

# inicia o OpenClaw
echo "Iniciando OpenClaw..."
exec openclaw
