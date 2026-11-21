#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

NETWORK="anvitha-platform-net"
INFRA="infra/docker-compose.yml"
APP="docker-compose.yml"

case "${1:-up}" in
  up)
    docker network inspect "$NETWORK" >/dev/null 2>&1 ||
      docker network create "$NETWORK"

    docker compose -f "$INFRA" up -d
    docker compose -f "$APP" up -d --build
    ;;
  down)
    docker compose -f "$APP" down
    docker compose -f "$INFRA" down
    ;;
  logs)
    docker compose -f "$INFRA" logs -f
    ;;
  *)
    echo "Usage: ./run.sh [up|down|logs]"
    exit 1
    ;;
esac
