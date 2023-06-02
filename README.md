# PrestaShop on Docker

[![Build status](https://github.com/PrestaShop/docker-ci/actions/workflows/docker.yml/badge.svg)](https://github.com/PrestaShop/docker-ci/actions/workflows/docker.yml)

## Supported tags

* `7.1`
* `7.2`
* `7.3`
* `7.4`
* `8.0`
* `8.1`, `latest`
* `8.2`

## What is this repository

This image contains the latest version of a Git branch from the PrestaShop repository. Useful to get at all time the latest changes or to test a specific pull-request.

## What is PrestaShop

PrestaShop is a free and open-source e-commerce web application, committed to providing the best shopping cart experience for both merchants and customers. It is written in PHP, is highly customizable, supports all the major payment services, is translated in many languages and localized for many countries, has a fully responsive design (both front and back office), etc. See all the available features.

> [www.prestashop.com](https://www.prestashop.com)

![PrestaShop's back office dashboard](http://www.prestashop.com/images/banners/general/ps161-screenshot-github.png "PrestaShop's back office dashboard")

## How to run this image

This image is running with the latest Apache version in the [official PHP repository](https://registry.hub.docker.com/_/php/).

**Important note:** In order to follow Docker best-practices, the database will be shortly removed from the PrestaShop container and an external one will be required.  You should immediately link a database container instead of using the internal one.

Currently, the most simple way to run this container is:
```
$ docker run -ti --name some-prestashop -p 8080:80 -d prestashop/prestashop
```

A new shop will be built, ready to be installed. You can then use it by reaching `http://localhost:8080`.
However, if you want to customize the container execution, here are many available options:

* **PS_DEV_MODE**: The constant `_PS_MODE_DEV_` will be set at `true` *(default value: 1)*
* **PS_HOST_MODE**: The constant `_PS_HOST_MODE_` will be set at `true`. Usefull to simulate a PrestaShop Cloud environment. *(default value: 0)*
* **DB_SERVER**: If set, the external MySQL database will be used instead of the volatile internal one *(default value: mysql)*
* **DB_USER**: Override default MySQL user *(default value: root)*
* **DB_PASSWD**: Override default MySQL password *(default value: admin)*
* **DB_PREFIX**: Override default tables prefix *(default value: ps_)*
* **DB_NAME**: Override default database name *(default value: prestashop)*
* **PS_INSTALL_AUTO=1**: The installation will be executed. Useful to initialize your image faster. (Please note that PrestaShop can be installed automatically from PS 1.5)
* **PS_LANGUAGE**: Change the default language installed with PrestaShop *(default value: en)*
* **PS_COUNTRY**: Change the default country installed with PrestaShop *(default value: gb)*
* **PS_FOLDER_ADMIN**: Change the name of the `admin` folder *(default value: admin-dev)*
* **PS_FOLDER_INSTALL**: Change the name of the `install` folder *(default value: install-dev)*

By default, we use the employee existing on the [PrestaShop demo](http://demo.prestashop.com). But you can change it with the following parameters:

* **ADMIN_MAIL**: Override default admin email *(default value: demo@prestashop.com)*
* **ADMIN_PASSWD**: Override default admin password *(default value: prestashop_demo)*

If your IP / port (or domain) change between two executions of your container, you will need to modify this option:

* **PS_HANDLE_DYNAMIC_DOMAIN**: Add specific configuration to handle dynamic domain *(default value: 0)*

## License

View [license information](https://www.prestashop.com/en/osl-license) for the software contained in this image.

## Documentation

The documentation (in English by default) is available at the following address [https://devdocs.prestashop.com/](https://devdocs.prestashop.com/)
