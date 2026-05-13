FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    git zip unzip libfreetype-dev libjpeg62-turbo-dev \
    libldap2-dev libpng-dev libzip-dev wait-for-it && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure ldap --with-libdir="lib/$(gcc -dumpmachine)" && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) pdo_mysql gd ldap zip

RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite && \
    sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
        /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' \
        /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
    sed -i 's/memory_limit = 128M/memory_limit = 512M/g' "$PHP_INI_DIR/php.ini"

ENV APACHE_DOCUMENT_ROOT="/app/public"
WORKDIR /app

COPY . /app

# Build frontend assets
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    npm ci && npm run production && \
    rm -rf node_modules && \
    apt-get purge -y nodejs && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN composer install --no-dev --optimize-autoloader && \
    chown -R www-data:www-data storage public/uploads bootstrap/cache

COPY benchmark/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
