#
# MAINTAINER        Benson Wang <chikaiwang@hotmail.com>
# DOCKER-VERSION    1.12.6
#
# Dockerizing Mariadb: Dockerfile for building Mariadb images
#
FROM dockerstudy/centos:7.4
MAINTAINER Benson Wang <chikaiwang@hotmail.com>

ENV DATA_DIR /var/lib/mysql
ENV TERM xterm

#RUN yum install -y mysql-server mysql 
RUN yum -y install mariadb mariadb-server && \
    yum clean all

COPY mysqld_charset.cnf /etc/my.cnf.d/
COPY my.cnf /etc/my.cnf
COPY scripts /scripts

RUN chmod +x /scripts/start.sh && \
    chmod +x /scripts/firstrun_maria.sh && \
    chmod +x /scripts/firstrun.sh

# EXPOSE 3306

CMD ["/scripts/start.sh"]