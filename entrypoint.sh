#!/bin/bash

case $1 in
	'')
		if [ -z "$(ls -A /var/www/grav)" ]; then
			echo "Checking out initial grav"
			cd /var/www

			git clone https://github.com/getgrav/grav.git
			git fetch --all --tags
			git checkout ${BRANCH}

			cd /var/www/grav

			bin/grav install

			echo "Installing admin plugin"
			bin/gpm install admin -y
		else
			echo "Updating and starting grav"
			cd /var/www/grav
			
			git fetch --all --tags
			git checkout ${BRANCH}
		fi
		chown -R www-data:www-data /var/www
		apache2-foreground
		;;
	*)
		exec "$@"
		chown -R www-data:www-data /var/www
		;;
esac