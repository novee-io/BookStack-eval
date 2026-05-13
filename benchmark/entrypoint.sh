#!/bin/bash
set -e

wait-for-it "${DB_HOST:-db}:${DB_PORT:-3306}" -t 60

php artisan migrate --force
chown -R www-data storage public/uploads bootstrap/cache

exec apache2-foreground
