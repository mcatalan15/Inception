#!/bin/bash

service mysql start;

# Wait for MySQL to start
sleep 10;

# Create the database if it does not exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Create a user if it does not exist
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'wordpress' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant privileges on the database to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'localhost';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'wordpress';"

# Create root user with wildcard host if it does not exist
mysql -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Grant all privileges to the root user
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

# Refresh all so that MySQL takes it into account
mysql -e "FLUSH PRIVILEGES;"

# Optionally, restart MySQL (ensure it’s required for your case)
# mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# Start SQL
exec mysqld

