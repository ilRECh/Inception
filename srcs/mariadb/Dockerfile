FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./createdb.sql /

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT_PASS

# Fix some of the variables
RUN sed -i "s/REPLACE_DB_NAME/$DB_NAME/g" /createdb.sql && \
    sed -i "s/REPLACE_USER/$DB_USER/g" /createdb.sql && \
    sed -i "s/REPLACE_PASSWORD/$DB_PASS/g" /createdb.sql && \ 
    sed -i "s/REPLACE_ROOT_PASS/$DB_ROOT_PASS/g" /createdb.sql

RUN service mysql start && mysql < createdb.sql && rm -f createdb.sql

EXPOSE 3306

CMD ip a && /usr/bin/mysqld_safe
