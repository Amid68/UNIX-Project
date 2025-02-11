FROM php:8.2-apache

# Install MySQL and PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Change Apache port from 80 to 8000
RUN sed -i 's/80/8000/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Copy application files
COPY html/ /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html/

# Modify your Dockerfile to change ports.conf and 000-default.conf
RUN sed -i 's/Listen 8000/Listen 80/g' /etc/apache2/ports.conf
RUN sed -i 's/*:8000/*:80/g' /etc/apache2/sites-available/000-default.conf