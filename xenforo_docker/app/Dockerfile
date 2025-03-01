# Base image
FROM php:8.2-apache

# Update packages and install composer and PHP dependencies.
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git zip unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libxslt-dev \
    libzip-dev \
    libgmp-dev \
    # Clear out the local repository of retrieved package files
    && apt-get clean \
    # Install PHP extensions
    && docker-php-ext-install pdo pdo_mysql mysqli \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure gd --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && docker-php-ext-install intl xml curl soap xsl bcmath opcache sockets exif gettext pcntl shmop sysvmsg sysvsem sysvshm gmp zip \
    # Enable PHP extensions
    && docker-php-ext-enable intl xml curl soap xsl bcmath opcache sockets exif gettext pcntl shmop sysvmsg sysvsem sysvshm gmp zip\
    # Install Composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable apache modules
RUN a2enmod rewrite 

# Working directory
WORKDIR /var/www/html

# Expose port 80 and start apache service
EXPOSE 80
CMD ["apache2-foreground"]
