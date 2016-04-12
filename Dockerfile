FROM ubuntu:16.04
MAINTAINER gijsmolenaar@gmail.com

ARG UID=1000
ARG DEB_BUILD_OPTIONS="parallel=32"
ARG  DEBEMAIL="Gijs Molenaar (launchpad ppa build key) <gijs@pythonic.nl>"

ENV UID ${UID}
ENV DEB_BUILD_OPTIONS ${DEB_BUILD_OPTIONS}
ENV DEBEMAIL ${DEBEMAIL}
ENV DEBIAN_FRONTEND noninteractive

# worldwide mirrors, enable universe & multiverse
ADD apt.sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        git \ 
        dpkg-dev \
        git-buildpackage \
        sudo \
        vim \
        debhelper

ADD sudo /etc/sudoers.d/builder
RUN chmod 440 /etc/sudoers.d/builder

RUN useradd --uid $UID builder --gid sudo

USER builder
WORKDIR /home/builder
