FROM mysql/mysql-server:latest
ENV MYSQL_ROOT_PASSWORD 123
ENV MYSQL_DATABASE voip
ENV MYSQL_USER user
ENV MYSQL_PASSWORD 123
ADD voip.sql /docker-entrypoint-initdb.d
EXPOSE 3306
