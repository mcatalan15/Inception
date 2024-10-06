FROM debian:11.7

RUN apt update -y && apt upgrade -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY --chmod=755 tools/mariadb.sh /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]
