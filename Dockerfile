FROM php:8.4-apache

RUN apt-get update && \
    apt-get install -y \
        git \
        unzip \
        mariadb-client \
        libzip-dev \
        libpng-dev \
        nodejs \
        npm \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        zip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install \
        gd \
        mysqli \
        pdo \
        pdo_mysql \
        zip && \
    rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY web/ .

RUN composer install --no-interaction --prefer-dist

RUN sed -ri -e 's!/var/www/html!/var/www/html/web!g' \
    /etc/apache2/sites-available/*.conf \
    /etc/apache2/apache2.conf \
    /etc/apache2/conf-available/*.conf && \
    a2enmod rewrite

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]