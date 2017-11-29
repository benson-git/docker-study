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

RUN wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
#RUN yum localinstall -y mysql57-community-release-el7-8.noarch.rpm
RUN rpm -ivh mysql57-community-release-el7-8.noarch.rpm
RUN yum install -y mysql-community-server && \
     yum clean all

#RUN yum install -y mysql-community-server && \
#    yum clean all

COPY mysqld_charset.cnf /etc/my.cnf.d/
COPY my.cnf /etc/my.cnf
COPY scripts /scripts

RUN chmod +x /scripts/start.sh && \
    chmod +x /scripts/firstrun_maria.sh && \
    chmod +x /scripts/firstrun.sh

# EXPOSE 3306

CMD ["/scripts/start.sh"]