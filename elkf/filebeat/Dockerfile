#
# MAINTAINER        Benson Wang <chikaiwang@hotmail.com>
# DOCKER-VERSION    1.12.6
#
# Dockerizing filebeat: Dockerfile for building filebeat images
#
FROM       prima/filebeat
MAINTAINER Benson Wang <chikaiwang@hotmail.com>

COPY logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt
COPY filebeat.yml /filebeat.yml