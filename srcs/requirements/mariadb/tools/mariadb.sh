#! /bin/bash

service mysql start;

sleep 10;

# Create the user if it doesn't exist
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Grant all privileges to the root user
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"

# Refresh all so that MySQL takes it into account
mysql -e "FLUSH PRIVILEGES;"



# Create a DB if does not exist. Named after the variable SQL_DATABASE in .env file
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# Give rights to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# Refresh all so that MySQL takes it into account
mysql -e "FLUSH PRIVILEGES;"

/etc/init.d/mysql stop

# Start SQL
exec mysqld

