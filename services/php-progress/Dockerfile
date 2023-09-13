FROM php:8.2-bullseye AS builder

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libzip-dev \
    unzip \
    git \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-install zip

LABEL lang="php"

COPY --from=composer:2.5.8 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY composer.json composer.lock* ./

RUN composer update
RUN composer install --no-dev


# -----------------------------------------------------------------

FROM php:8.2-fpm-alpine

WORKDIR /var/www/html

LABEL lang="php"

RUN apk add --no-cache libpq \
  autoconf \
  g++ \ 
  make \
  unzip \
  git

RUN pecl install mongodb \
  && docker-php-ext-enable mongodb

COPY --from=builder /var/www/html/vendor ./vendor

COPY . .

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm"]