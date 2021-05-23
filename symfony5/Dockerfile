FROM php:7.3-fpm

# Actualizamos nuestras librerías
RUN apt update
RUN apt list --upgradable
RUN apt -y upgrade

# Instalamos módulos PHP necesarios
RUN docker-php-ext-install pdo_mysql

RUN pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini

RUN apt-get -y install zlib1g-dev libzip-dev nginx tar openssl libxrender-dev libx11-dev libxext-dev libfontconfig1-dev libfreetype6-dev fontconfig libcurl3-dev libxml2-dev wget xfonts-base xfonts-75dpi libc-client2007e-dev libc-client-dev libkrb5-dev libpng-dev libjpeg62-turbo-dev nano htop procps cron

RUN docker-php-ext-install zip
RUN docker-php-ext-install curl
RUN docker-php-ext-install soap
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install dom
RUN docker-php-ext-install intl
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
RUN docker-php-ext-install bcmath

COPY ./scripts/startup.sh /etc/startup.sh
RUN chmod 777 /etc/startup.sh

# Instalamos composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Copiamos la configuración
COPY ./common/default.conf /etc/nginx/conf.d/default.conf
COPY ./common/default.conf /etc/nginx/sites-available/default
COPY ./common/extra-conf.ini /usr/local/etc/php/conf.d/extra-conf.ini

# Ponemos correctamente la hora del servidor
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /var/www/

EXPOSE 80

ENTRYPOINT ["/etc/startup.sh"]