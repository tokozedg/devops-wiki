FROM ubuntu:xenial

MAINTAINER Tornike Zedginidze <tokozedg@gmail.com>

RUN \
      echo 'deb http://ppa.launchpad.net/jonathonf/sphinx/ubuntu xenial main' \
      >> /etc/apt/sources.list && \
      apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F06FC659 && \
      apt-get update && \
      apt-get install -y sphinx-common python-sphinxcontrib-programoutput \
      python-sphinxcontrib.seqdiag python-sphinxcontrib.actdiag \
      python-sphinxcontrib.blockdiag python-sphinxcontrib.nwdiag \
      python-sphinxcontrib.spelling python-tabulate entr make && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/devops-wiki/

EXPOSE 80
CMD make watch
