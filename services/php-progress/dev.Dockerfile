# Use the official PHP image with FPM
FROM php:8.2-fpm

# Install necessary system packages and PHP extensions
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libzip-dev \
    unzip \
    git \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-install zip

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

COPY . .

# Make sure the composer binary is executable
RUN chmod +x /usr/local/bin/composer

RUN composer install

# Expose port 9000 for FPM
EXPOSE 9000

# By default, start php-fpm
CMD ["php-fpm"]
