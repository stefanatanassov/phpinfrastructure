FROM php:8.4-fpm

RUN apt-get update \
    && apt-get install -y git unzip libicu-dev libzip-dev zip \
    && docker-php-ext-install intl pdo_mysql zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/app

CMD ["php-fpm"]
