#
# MAINTAINER        Benson Wang <chikaiwang@hotmail.com>
# DOCKER-VERSION    1.12.6
#
# Dockerizing Mariadb: Dockerfile for building Mariadb images
#
FROM dockerstudy/centos:7.4
MAINTAINER Benson Wang <chikaiwang@hotmail.com>

ENV DATA_DIR /var/lib/mysql

# Install Mariadb
RUN yum install -y mariadb mariadb-server && \
    yum clean all

ADD mysqld_charset.cnf /etc/my.cnf.d/

COPY scripts /scripts
RUN chmod +x /scripts/start.sh && \
    chmod +x /scripts/firstrun_maria.sh && \
    chmod +x /scripts/firstrun.sh

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/scripts/start.sh"]