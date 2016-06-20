#
# Basic php7-fpm box
#
FROM php:7-fpm

# Install the PHP extensions we need plus composer
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libmagickwand-dev \
    mysql-client \
    ssh \
  && pecl install xdebug \
  && pecl install imagick \
  && docker-php-ext-install \
    curl \
    opcache \
    pdo \
    pdo_mysql \
  && docker-php-ext-enable imagick \
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '070854512ef404f16bac87071a6db9fd9721da1684cd4589b1196c3faf71b9a2682e2311b36a5079825e155ac7ce150d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer \
  && php -r "unlink('composer-setup.php');" \
  && curl -fsSL -o /usr/local/bin/phpunit "https://phar.phpunit.de/phpunit.phar" \
  && chmod +x /usr/local/bin/phpunit \
  && apt-get -y clean \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/* || true \
  && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

COPY php-fpm.conf /usr/local/etc/
COPY php.ini /usr/local/etc/php/
