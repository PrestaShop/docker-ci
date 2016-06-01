FROM php:5.5-apache

MAINTAINER Thomas Nabord <thomas.nabord@prestashop.com>

ENV PS_VERSION 1.7.0.0

ENV PS_DOMAIN prestashop.local
ENV DB_SERVER 127.0.0.1
ENV DB_PORT 3306
ENV DB_NAME prestashop
ENV DB_USER root
ENV DB_PASSWD admin
ENV ADMIN_MAIL demo@prestashop.com
ENV ADMIN_PASSWD prestashop_demo
ENV PS_LANGUAGE en
ENV PS_COUNTRY gb
ENV PS_INSTALL_AUTO 0
ENV PS_DEV_MODE 0
ENV PS_HOST_MODE 0
ENV PS_HANDLE_DYNAMIC_DOMAIN 0

ENV PS_FOLDER_ADMIN admin
ENV PS_FOLDER_INSTALL install

RUN apt-get update \
	&& apt-get install -y libmcrypt-dev \
		libjpeg62-turbo-dev \
		libpng12-dev \
		libfreetype6-dev \
		libxml2-dev \
		wget \
		unzip \
	        nodejs \
	        npm \
	        curl \
	        git \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install iconv mcrypt pdo mysql pdo_mysql mbstring soap gd

# Get PrestaShop
RUN git clone --depth=50 --branch=develop https://github.com/PrestaShop/PrestaShop.git /var/www/html/
COPY config_files/docker_updt_ps_domains.php /var/www/html/

# Apache configuration
RUN a2enmod rewrite
RUN chown www-data:www-data -R /var/www/html/

# PHP configuration
COPY config_files/php.ini /usr/local/etc/php/

VOLUME /var/www/html/modules
VOLUME /var/www/html/themes
VOLUME /var/www/html/override

COPY config_files/docker_run.sh /tmp/
CMD ["/tmp/docker_run.sh"]
