#!/bin/bash -ev

IMAGE=dockdebbuild32

docker -D build --tag=${IMAGE} .

docker run -i -t -v /home/gijs/build:/build ${IMAGE} /bin/bash
