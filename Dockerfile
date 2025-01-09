FROM php:8.2-apache

# Install MySQL client and PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy application files
COPY html/ /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html/