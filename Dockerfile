FROM php:8.2-apache

# Install MySQL and other dependencies
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy application files from html directory to Apache's web root
COPY html/ /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html/