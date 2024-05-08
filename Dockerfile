FROM php:8.2-fpm

ARG user
ARG uid

# Set the working directory to /var/www/html
WORKDIR /var/www/html
# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Install any needed extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN adduser -D -H -u 1000 -s /bin/bash -Gwww-data $user
#RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# WORKDIR /var/www/html

USER $user

# Expose port 9000 and start php-fpm server
#EXPOSE 9000
#CMD ["php-fpm"]