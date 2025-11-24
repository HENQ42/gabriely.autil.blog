#!/bin/bash

echo "--- Configuração do Hugo (Standard Edition) ---"

# 1. Configurar Ambiente Go (Recupera o que foi feito no go_install.sh)
# Precisamos dizer onde o Go está para poder usá-lo para instalar o Hugo.
export GOROOT="$HOME/go_local/go"
export PATH="$GOROOT/bin:$PATH"

# 2. Definir onde o binário do Hugo será salvo
# Conforme a doc: "If GOBIN is set, binaries are installed to that directory."
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export PATH="$GOBIN:$PATH"

# Verificação de segurança: O Go existe?
if ! command -v go &>/dev/null; then
  echo "ERRO: 'go' não encontrado."
  echo "Certifique-se de rodar o './go_install.sh' antes deste script."
  exit 1
fi

# 3. Lógica de Versão (Latest ou Específica)
if [ -z "$HUGO_VERSION" ]; then
  echo "Variável HUGO_VERSION não definida. Usando 'latest'..."
  INSTALL_VERSION="latest"
else
  echo "Variável HUGO_VERSION detectada: $HUGO_VERSION"
  # O 'go install' requer o prefixo 'v' para versões semânticas (ex: v0.123.0)
  # Se o usuário colocou apenas '0.123.0', adicionamos o 'v'.
  if [[ "$HUGO_VERSION" != v* ]]; then
    INSTALL_VERSION="v${HUGO_VERSION}"
  else
    INSTALL_VERSION="$HUGO_VERSION"
  fi
fi

# 4. Instalar Hugo (Standard Edition)
# Comando extraído da doc: go install github.com/gohugoio/hugo@latest
echo "Compilando e instalando Hugo Standard ($INSTALL_VERSION)..."
go install github.com/gohugoio/hugo@"$INSTALL_VERSION"

# 5. Verificação Final
echo "Verificando instalação:"
if command -v hugo &>/dev/null; then
  # Mostra a versão instalada
  hugo version
  echo "--- Instalação do Hugo concluída com sucesso ---"
else
  echo "ERRO: Falha ao instalar ou encontrar o executável 'hugo'."
  exit 1
fi
