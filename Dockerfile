FROM ubuntu:13.10
MAINTAINER Claus Albøge <csa@csa-net.dk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install wget ca-certificates openjdk-7-jre-headless -y
RUN wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.deb -O /tmp/elasticsearch-1.0.1.deb
RUN dpkg -i /tmp/elasticsearch-1.0.1.deb
RUN /bin/echo -e "elasticsearch soft nofile 60000\nelasticsearch hard nofile 60000" > /etc/security/limits.d/elasticsearch
ADD elasticsearch.sh /usr/local/bin/elasticsearch.sh
RUN chmod +x /usr/local/bin/elasticsearch.sh

EXPOSE 9200 9300
CMD ["/usr/local/bin/elasticsearch.sh"]



