FROM prestashop/base:8.0-apache

LABEL maintainer="PrestaShop Core Team <coreteam@prestashop.com>"

RUN apt-get update \
	&& apt-get install -y curl \
        git \
    && rm -rf /var/lib/apt/lists/*

# Get PrestaShop
RUN git clone --depth=50 --branch=develop https://github.com/PrestaShop/PrestaShop.git /var/www/html/

# Get composer
RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer && rm -rf /tmp/composer-setup.php

# Apache configuration
RUN chown www-data:www-data -R /var/www/html/

COPY config_files/docker_run_git.sh /tmp/
RUN ["chmod", "+x", "/tmp/docker_run_git.sh"]
CMD ["/tmp/docker_run_git.sh"]
