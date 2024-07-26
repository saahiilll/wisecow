FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/games/cowsay /usr/local/bin/cowsay
RUN ln -s /usr/games/fortune /usr/local/bin/fortune

MAINTAINER Sahil Dahake <sahildahake1999@gmail.com>

COPY wisecow.sh /usr/local/bin/wisecow.sh

RUN chmod +x /usr/local/bin/wisecow.sh

EXPOSE 4499

ENTRYPOINT ["/usr/local/bin/wisecow.sh"]
