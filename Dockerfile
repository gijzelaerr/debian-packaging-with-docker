FROM gijzelaerr/trusty
MAINTAINER gijs@pythonic.nl
ENV DEBIAN_FRONTEND noninteractive
ENV DEB_BUILD_OPTIONS parallel=32

ADD apt.sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y devscripts

## passwordless sudo
RUN sed -i 's/%admin ALL=(ALL) ALL/%admin ALL=(ALL) NOPASSWD:ALL/g' /etc/sudoers

RUN addgroup --system admin
RUN addgroup --gid 1070 builder
RUN adduser --system  --shell /bin/sh --uid 1069 --gid 1070 builder
RUN adduser builder admin

USER builder
