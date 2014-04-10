#!/bin/bash -e

sudo debootstrap --arch i386 --components=main,universe,multiverse,restricted trusty trusty32 http://za.archive.ubuntu.com/ubuntu/
sudo chroot trusty32 apt-get clean
sudo tar -C trusty32 -c . | docker import - gijzelaerr/trusty32
docker push gijzelaerr/trusty32
