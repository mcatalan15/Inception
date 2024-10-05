#! /bin/bash

service mysql start;

sleep 5;

# Create a DB if does not exist. Named after the variable SQL_DATABASE in .env file
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Creating a user that can manipulate the DB. Usage of SQL_USER & SQL_PASSWORD indicated in .env file
mysql -e "CREATE USER IF NOT EXIST \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Give rights to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}`@'%' IDENTIFIED BY \'${SQL_PASSWORD}`';"

# Change root user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Refresh all so that MySQL takes it into account
mysql -e "FLUSH PRIVILEGES;"

# Restart MySQL to take effect
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start SQL
exec mysqld_safe
