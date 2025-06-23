#!/usr/bin/env bash
set -euo pipefail

# Build the PHP container and dependencies

docker compose build

# Install Symfony skeleton if not already present
if [ ! -f composer.json ]; then
  echo "Installing Symfony skeleton..."
  docker compose run --rm php composer create-project symfony/skeleton .
fi

# Start all services in detached mode

docker compose up -d

echo "Environment is up. Run 'docker compose exec php php -S 0.0.0.0:8000 -t public' to start the dev server."
