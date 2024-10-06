#! /bin/bash

 if [ -f ./wp-config.php ]
 then
 	echo "Wordpress already exists"
 else
 	wp core download --allow-root
 	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
 	wp core install --url=$DOMAIN_NAME --title="$WORDPRESS_TITLE" --admin_user=$WORDPRESS_ADMIM --admin_password=$WORDPRESS_ADMIM_PASS  --admin_email=$WORDPRESS_ADMIM_EMAIL --skip-email --allow-root
 	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASS --allow-root
 	wp theme install twentytwentyfour --activate --allow-root
 fi

 /usr/sbin/php-fpm7.3 -F;

##!/bin/bash

# Check if wp-config.php exists
#if [ -f ./wp-config.php ]; then
#    echo "WordPress configuration file already exists."
#else
#    echo "Downloading WordPress core files..."
#    wp core download --allow-root

#    echo "Creating wp-config.php..."
#    wp config create --dbname="$MYSQL_DATABASE" \
#                     --dbuser="$MYSQL_USER" \
#                     --dbpass="$MYSQL_PASSWORD" \
#                     --dbhost="$MYSQL_HOSTNAME" \
#                     --allow-root

#    echo "Installing WordPress..."
#    wp core install --url="$DOMAIN_NAME" \
#                    --title="$WORDPRESS_TITLE" \
#                    --admin_user="$WORDPRESS_ADMIN" \
#                    --admin_password="$WORDPRESS_ADMIN_PASS" \
#                    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
#                    --skip-email \
#                    --allow-root

#    echo "Creating WordPress user..."
#    wp user create "$WORDPRESS_USER" "$WORDPRESS_EMAIL" --role=author --user_pass="$WORDPRESS_USER_PASS" --allow-root

#    echo "Installing and activating the theme..."
#    wp theme install twentytwentyfour --activate --allow-root
#fi

# Start PHP-FPM
#echo "Starting PHP-FPM..."
#/usr/sbin/php-fpm7.3 -F
