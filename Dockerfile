FROM ubuntu/13:10
MAINTAINER Claus Albøge <csa@csa-net.dk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.deb -O /tmp/elasticsearch-1.0.1.deb
RUN dpkg -i /tmp/elasticsearch-1.0.1.deb



