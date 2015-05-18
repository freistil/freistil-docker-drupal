FROM ubuntu:trusty
MAINTAINER John Doe <ops@freistil.it>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install \
    supervisor \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Image setup scripts
ADD run.sh /run.sh

# Some service
ADD service/start.sh /setup/service-start.sh

# Boot container
RUN chmod 755 /run.sh /setup/*.sh
CMD ["/run.sh"]
