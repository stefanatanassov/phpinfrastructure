# Symfony Docker Boilerplate

This repository provides a minimal Docker setup for running a Symfony application
with MySQL and PHP 8.4. The actual Symfony skeleton is not committed; run the
included `setup.sh` script inside the Docker container to install it
automatically into the existing directory.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (20+)
- [Docker Compose](https://docs.docker.com/compose/) v2

## Initial Setup

1. Build the PHP container:

   ```bash
   docker compose build
   ```

2. Install the Symfony skeleton (run once):

   ```bash
   docker compose run --rm php bash setup.sh
   ```

   The script downloads the latest Symfony skeleton into a temporary directory
   and copies it into your project automatically.

3. Start the services:

   ```bash
   docker compose up -d
   ```

4. Serve the application (development mode):

   ```bash
   docker compose exec php php -S 0.0.0.0:8000 -t public
   ```

   Visit <http://localhost:8000> in your browser.

## Database Configuration

The `db` service uses MySQL 8 and exposes port `3306`. Default credentials are
configured in `docker-compose.yml`:

```yml
MYSQL_ROOT_PASSWORD: root
MYSQL_DATABASE: app
MYSQL_USER: app
MYSQL_PASSWORD: app
```

You can adjust these values as needed and reference them in your Symfony `.env`
file.

## Running in Different Environments

### Development

- Use `docker compose up` to start the stack.
- Source code changes are immediately available inside the container through the
  mounted volume.
- Run Symfony console commands via `docker compose exec php php bin/console`.

### Production

- Build a production image with optimized autoloader and assets.
- Use a production-ready web server (e.g., Nginx) that forwards requests to the
  PHP-FPM container.
- Ensure environment variables and database credentials are configured securely.

### Continuous Integration

Use the same Docker configuration within your CI pipeline to run tests and
build artifacts in a reproducible environment.

## License

This project is provided as a starting point and may be used under the terms of
your choice.
