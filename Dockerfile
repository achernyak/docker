FROM jenkins
USER root
MAINTAINER Artem Chernyak <artem.chernyak@monsanto.com>

# install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# install nodejs 0.12
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs



