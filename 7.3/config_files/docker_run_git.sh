#!/bin/sh

if [ ! -f ./vendor/autoload.php  ]; then
	echo "\n* Vendor autoloader not found, running composer ...";
	composer install --no-interaction
fi

bash /tmp/docker_run.sh
