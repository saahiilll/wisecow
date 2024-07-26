FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# create softlink of packages to the bin directory
RUN ln -s /usr/games/cowsay /usr/local/bin/cowsay
RUN ln -s /usr/games/fortune /usr/local/bin/fortune

MAINTAINER Sahil Dahake <sahildahake1999@gmail.com>

# copy the wisecow script to the bin directory
COPY wisecow.sh /usr/local/bin/wisecow.sh

# executable permission to the wisecow.sh file
RUN chmod +x /usr/local/bin/wisecow.sh

# expose the container port
EXPOSE 4499

ENTRYPOINT ["/usr/local/bin/wisecow.sh"]
