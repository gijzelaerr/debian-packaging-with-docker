VERSION=0.1
DOCKER_REPO=radioastro/packager:$(VERSION)


.PHONY: build clean run 


all: build run 


build:
	docker build -t ${DOCKER_REPO} .


clean:
	docker rmi ${DOCKER_REPO}


run:
	docker run -v `pwd`/build:/build:rw -ti ${DOCKER_REPO}

