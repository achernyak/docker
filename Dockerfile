FROM jenkins
USER root
MAINTAINER Artem Chernyak <artem.chernyak@monsanto.com>

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt