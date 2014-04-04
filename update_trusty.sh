#!/bin/bash -e

sudo debootstrap --components=main,universe,multiverse,restricted trusty trusty http://za.archive.ubuntu.com/ubuntu/
sudo chroot trusty apt-get clean
sudo tar -C trusty -c . | docker import - gijzelaerr/trusty
docker push gijzelaerr/trusty
