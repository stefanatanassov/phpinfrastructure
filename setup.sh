#!/bin/bash
set -euo pipefail

# Build the PHP image
echo "Building Docker containers..."
docker compose build

# Install Symfony skeleton if not already installed
if [ ! -f composer.json ]; then
    echo "Installing Symfony skeleton..."
    docker compose run --rm php composer create-project symfony/skeleton .
fi

# Start services in detached mode
echo "Starting Docker services..."
docker compose up -d

echo "Environment is ready."
echo "You can now run: docker compose exec php php -S 0.0.0.0:8000 -t public"
