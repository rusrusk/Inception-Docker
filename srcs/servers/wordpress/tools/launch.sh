#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

####### MANDATORY PART ##########

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
###################################











































# #!/bin/bash

# #Replace all occurrences of a string in a file by overwriting the file (i.e. in place):
# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
# # -R recursively change permissions for directories and their contents
# chmod -R 775 /var/www/html/wordpress;
# # This will change the owner of all files and
# # subdirectories in /var/www/html/wordpress directory to a new owner and group named www-data :
# chown -R www-data /var/www/html/wordpress;
# mkdir -p /run/php/;
# touch /run/php/php7.3-fpm.pid;

# # php -S 0.0.0.0:9000 -t /var/www/html/wordpress

# if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
# echo "Wordpress: setting up..."
# # After checking the requirements, download the wp-cli.phar file using wget or curl:
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# # "+x" means - set the permission to run (x) the file for all users.
# chmod +x wp-cli.phar;
# #To use WP-CLI from the command line, by typing wp, make the file executable and move it somewhere in the PATH. For example:
# mv wp-cli.phar /usr/local/bin/wp
# cd /var/www/html/wordpress;
# # Загружает и извлекает основные файлы WordPress по указанному пути Downloads and extracts main Wordpress files at pointed path

# # static website
# 	mkdir -p /var/www/html/wordpress/mysite;
#     mv /var/www/index.html /var/www/html/wordpress/mysite/index.html;

# wp core download --allow-root;
# mv /var/www/wp-config.php /var/www/html/wordpress;
# echo "Wordpress: creating users..."
# #Creates WordPress tables in the database,
# #using the url, title and default admin user details provided
# wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};
# # Creates a new user
# wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;
# # Wordpress theme
# wp theme install inspiro --activate --allow-root

# # # enable redis cache
# #     sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
# #     sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
# #     #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
# #     sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
# #     sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
# #     sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

# #     wp plugin install redis-cache --activate --allow-root
# #     wp plugin update --all --allow-root

# # echo "Wordpress: set up!"
# # else
# # echo "Wordpress: is already set up!"
# # fi

# # wp redis enable --allow-root

# # echo "Wordpress started on :9000"
# # /usr/sbin/php-fpm7.3 -F