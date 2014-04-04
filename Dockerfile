FROM gijzelaerr/trusty
MAINTAINER gijs@pythonic.nl
ENV DEBIAN_FRONTEND noninteractive

ADD apt.sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y devscripts

## passwordless sudo
RUN sed -i 's/%admin ALL=(ALL) ALL/%admin ALL=(ALL) NOPASSWD:ALL/g' /etc/sudoers

RUN addgroup admin
RUN adduser --system  --shell /bin/sh --ingroup admin builder

USER builder
