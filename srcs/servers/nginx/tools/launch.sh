sudo openssl req \
-x509 -nodes -days 365 -newkey rsa:4096 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
if [ ! -f /etc/ssl/certs/nginx.crt ]; then 
echo "NGINX is setting up ssl-certificate...";
#<openssl> is basic command line tool for creating and managing OpenSSL certificates, keys and other files.
#<req> subcommand specifies that we want to use x.509 certif
#<x509> is a public key infrastructure standard that SSL adheres to for its key and certif management.
#<nodes>it tells to skip option to secure our certif with passphrase.
#<days -365> it sets length of time that certif will be considered valid. We set one year
#<newkey rsa:2048> it specifies we want to generate new certif and new key at the same time. 
#<rsa2048> option tells it to make rsa key that is 4096 bits long
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		#<keyout> it tells openssl where to place generated private key file that we create.
		#<out> it tells openssl where to place certif that we create
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=DE/ST=Niedersachsen/L=Wolfsburg/O=42Wolfsburg/O=Inception/CN=rkultaev.42.fr"
echo "NGINX ssl is set up!";
fi

#For Docker containers <daemon off> directive tells NGINX to stays in foreground.
#For containers it is useful as best practice is for 1 container = 1 process.
# nginx -g 'daemon off';





# f [ ! -f /etc/ssl/certs/nginx.crt ]; then
# echo "Nginx: setting up ssl ...";
# openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
# 		-keyout /etc/ssl/private/nginx.key \
# 		-out /etc/ssl/certs/nginx.crt \
# 		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=wordpress/CN=rbiodies.42.fr";
# echo "Nginx: ssl is set up!";
# fi

# # Run nginx
# # Nginx использует daemon off директиву для запуска на переднем плане
# nginx -g 'daemon off;';
