#!/bin/bash

# Replace all occurrences of a string in a file by overwriting the file (i.e. in place):
#	already done manually, keeping it in just in case
#sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
# -R recursively change permissions for directories and their contents
chmod -R 775 /var/www/html/wordpress;
# The following example will change the owner of all files and
# subdirectories in the /var/www/html/wordpress directory with a new owner and group named www-data :
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

# php -S 0.0.0.0:9000 -t /var/www/html/wordpress

# After checking the requirements, download the wp-cli.phar file using wget or curl:
# then, make it executable and move it to PATH
# Downloads and extracts the main WordPress files
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
echo "Wordpress: setting up..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;

chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

cd /var/www/html/wordpress;

# static website
#	mkdir -p /var/www/html/wordpress/mysite;
#	mv /var/www/index.html /var/www/html/wordpress/mysite/index.html;

wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;
echo "Wordpress: creating users..."
# Creates WordPress tables in the database,
# using the url, title and default admin user details provided
#	--url=<url>
# Address of the new site.
#	--title=<site name>
# The name of the new site.
#	--admin_user=<username>
# Administrator username.
#	[--admin_password=<password>]
# Password for the admin user. The default is a randomly generated string.
#	--admin_email=<email>
# Administrator's email address.
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};
# Creates a new user
#	<user-login>
# Username to create.
#	<user-email>
# The email address of the user to create.
#	[--role=<role>]
# User role to create. Default: default role
# Possible values ​​include "administrator", "editor", "author", "contributor", "subscriber".
#	[--user_pass=<password>]
# User password. Default: randomly generated
wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;
# Theme for WordPress
wp theme install inspiro --activate --allow-root

# # enable redis cache
#     sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
#     sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
#     #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
#     sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
#     sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
#     sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

#    wp plugin install redis-cache --activate --allow-root
#    wp plugin update --all --allow-root

echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

#wp redis enable --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 -F