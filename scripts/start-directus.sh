#!/usr/bin/env bash
set -euo pipefail

required_vars=(
  DB_CONNECTION_STRING
  ADMIN_EMAIL
  ADMIN_PASSWORD
  DIRECTUS_SECRET
)

for var in "${required_vars[@]}"; do
  if [ -z "${!var:-}" ]; then
    echo "ERREUR: variable Codespaces manquante: $var"
    exit 1
  fi
done

echo "Démarrage de Directus..."

docker rm -f gedmvp-directus >/dev/null 2>&1 || true

docker pull directus/directus:12.3.1

docker run   --name gedmvp-directus   -p 8055:8055   -e HOST=0.0.0.0   -e PORT=8055   -e SECRET="$DIRECTUS_SECRET"   -e DB_CLIENT=pg   -e DB_CONNECTION_STRING="$DB_CONNECTION_STRING"   -e ADMIN_EMAIL="$ADMIN_EMAIL"   -e ADMIN_PASSWORD="$ADMIN_PASSWORD"   -e WEBSOCKETS_ENABLED=true   -e TELEMETRY=false   directus/directus:12.3.1
