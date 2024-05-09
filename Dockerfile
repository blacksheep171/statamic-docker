FROM php:8.2-fpm

# Set the working directory to /var/www/html
WORKDIR /var/www
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

#COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN rm -fr /usr/local/etc/php-fpm/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Add user for laravel application
RUN groupadd -g 1000 terrace
RUN useradd -u 1000 -ms /bin/bash -g terrace terrace

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions
COPY --chown=terrace:terrace . /var/www

RUN chmod -R 777 /var/www

# Change current user to www
USER terrace

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]