#!/bin/bash -e

IMAGE=dockdebbuild

docker build --tag=${IMAGE} .

docker run -i -t -v /home/gijs/build:/build ${IMAGE} /bin/bash
