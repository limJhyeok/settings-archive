#!/bin/bash

set -e  

DEFAULT_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
INSTALL_DIR="/usr/local/bin"
COMPOSE_BIN="${INSTALL_DIR}/docker-compose"

# if user selects version then install that version or not latest
read -p "Enter Docker Compose version you want (or press Enter to install the latest: ${DEFAULT_VERSION}): " VERSION
VERSION=${VERSION:-$DEFAULT_VERSION}

echo "Docker Compose v${VERSION} Downloads..."
curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o $COMPOSE_BIN

chmod +x $COMPOSE_BIN

# 설치 완료 메시지 및 버전 확인
echo "Docker Compose Installation Complete!"
$COMPOSE_BIN --version
