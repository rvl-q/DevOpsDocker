#!/bin/sh

# usage ./git2dock.sh <shotened gitrepo url> <docker-app-name>
# example1:
# ./git2dock.sh rvl-q/hello-world hello-world
# example2:
# ./git2dock docker-hy/ml-kurkkumopo-frontend kurkkumopo-frontti
# goes from:
# https://github.com/docker-hy/ml-kurkkumopo-frontend.git
# to:
# <dockerusename>/kurkkumopo-frontti

GIT_REPO=https://github.com/$1.git
D_NAME=$2
D_USER=`docker info | sed '/Username:/!d;s/.* //'`
D_TAG="${D_USER}"/"${D_NAME}"

echo git url is: "${GIT_REPO}"
echo your docker username is: "${D_USER}"
echo the full docker tag is: "${D_TAG}"

# set volumes and environment and enter the container
docker run \
	-v $HOME/.docker:/root/.docker \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-e GIT_REPO=$GIT_REPO \
	-e D_USER=$D_USER \
	-e D_TAG=$D_TAG \
	container-32-builder
 