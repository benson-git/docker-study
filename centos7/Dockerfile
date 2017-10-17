#
# MAINTAINER        Benson Wang <chikaiwang@hotmail.com>
# DOCKER-VERSION    1.12.6
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       centos:centos7.4.1708
MAINTAINER Benson Wang <chikaiwang@hotmail.com>

ENV TZ "Asia/Shanghai"
ENV TERM xterm

ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo

ENV TZ "Asia/Shanghai"

RUN yum -y install curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
    yum install -y gcc gcc-c++ git make automake cmake patch python-devel libpng-devel libjpeg-devel epel-release && \
    yum install -y --enablerepo=epel pwgen python-pip && \
    yum clean all

RUN pip install supervisor && \
    pip install --upgrade pip && \
    mkdir -p /etc/supervisor/confd && \
    mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisord.conf

# EXPOSE 22

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]