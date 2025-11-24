#!/bin/bash

# Diretório de instalação (user space do Vercel)
INSTALL_DIR="$HOME/go_local"
OS="linux"
ARCH="amd64"

echo "--- Configuração do Go no Vercel ---"

# 1. Lógica para determinar a versão
if [ -z "$GO_VERSION" ]; then
  echo "Variável GO_VERSION não definida. Buscando a versão 'latest'..."
  # Obtém a versão mais recente diretamente do site oficial do Go
  # O comando retorna algo como "go1.25.4"
  VERSION_TAG=$(curl -s https://go.dev/VERSION?m=text | head -n 1)
else
  echo "Variável GO_VERSION detectada: $GO_VERSION"
  # Garante que o prefixo 'go' exista (ex: transforma 1.25.4 em go1.25.4)
  if [[ "$GO_VERSION" == go* ]]; then
    VERSION_TAG="$GO_VERSION"
  else
    VERSION_TAG="go${GO_VERSION}"
  fi
fi

# Nome do arquivo final
GO_FILE="${VERSION_TAG}.${OS}-${ARCH}.tar.gz"
GO_URL="https://go.dev/dl/${GO_FILE}"

echo "Versão selecionada: ${VERSION_TAG}"
echo "URL de download: ${GO_URL}"

# 2. Baixar o arquivo
echo "Baixando ${GO_FILE}..."
curl -L -o "${GO_FILE}" "${GO_URL}"

# Verifica se o download foi bem sucedido
if [ $? -ne 0 ]; then
  echo "Erro ao baixar o Go. Verifique se a versão existe."
  exit 1
fi

# 3. Limpar instalação antiga
if [ -d "${INSTALL_DIR}/go" ]; then
  echo "Removendo instalação anterior em ${INSTALL_DIR}..."
  rm -rf "${INSTALL_DIR}/go"
fi

# Criar diretório
mkdir -p "${INSTALL_DIR}"

# 4. Extrair
echo "Extraindo..."
tar -C "${INSTALL_DIR}" -xzf "${GO_FILE}"

# 5. Configurar PATH para a sessão atual do script
export PATH="${INSTALL_DIR}/go/bin:$PATH"

# 6. Verificar e Limpar
echo "Verificação final:"
go version
rm "${GO_FILE}"

echo "--- Instalação concluída ---"
