FROM jenkins
USER root
MAINTAINER Artem Chernyak <artem.chernyak@monsanto.com>

# install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# install nodejs 0.12
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

# install global nodejs packages
RUN npm install -g grunt-cli
RUN npm install -g jshint

# install phantomjs
RUN apt-get install build-essential g++ flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev python libX11-dev libxext-dev
RUN git clone git://github.com/ariya/phantomjs.git
RUN cd phantomjs
RUN git checkout 2.0
RUN ./build.sh