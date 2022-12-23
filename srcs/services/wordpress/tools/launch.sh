#!/bin/bash

# Replace all occurrences of a string in a file by overwriting the file (i.e. in place):
#	already done manually, keeping it in just in case
# -R recursively change permissions for directories and their contents
chmod -R 775 /var/www/html/wordpress;
# The following example will change the owner of all files and
# subdirectories in the /var/www/html/wordpress directory with a new owner and group named www-data :
chown -R www-data:www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

# After checking the requirements, download the wp-cli.phar file using wget or curl:
# then, make it executable and move it to PATH
# Downloads and extracts the main WordPress files
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
echo "Wordpress: setting up..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
echo $(php wp-cli.phar --info --allow-root)
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;


#download and configure wordpress
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
wp core install --allow-root --url=${WORDPRESS_URL} \
				--title=${WORDPRESS_TITLE} \
				--admin_user=${WORDPRESS_ADMIN_LOGIN} \
				--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
				--admin_email=${WORDPRESS_ADMIN_EMAIL};
echo "Admin user has been created!"
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
wp user create --allow-root ${WORDPRESS_USER_LOGIN} ${WORDPRESS_USER_EMAIL} --role=contributor --user_pass=${WORDPRESS_USER_PASSWORD};
# Theme for WordPress
# wp theme install inspiro --activate --allow-root


echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 -F