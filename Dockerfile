FROM ubuntu:16.04
MAINTAINER gijsmolenaar@gmail.com

# worldwide mirrors, enable universe & multiverse
ADD apt.sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        git \ 
        dpkg-dev \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#add-apt-repository -y ppa:radio-astro/main && \
