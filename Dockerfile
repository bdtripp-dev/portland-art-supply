FROM php:8.4-apache
RUN rm -f /var/www/html/index.html
RUN apt-get update \
    && apt-get install -y curl \
    && docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite
COPY public/ /var/www/html/
COPY includes/ /var/www/html/includes/
COPY vendor/ /var/www/html/vendor/
EXPOSE 80