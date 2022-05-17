#!/bin/sh

echo ""
echo hello from container builder
echo ""
echo git url is: "${GIT_REPO}"
echo your docker username is: "${D_USER}"
echo the full docker tag is: "${D_TAG}"
echo ""
echo starting build in 5 s ...maybe less
echo hit ctrl-c if something is wrong
sleep 3

_OLDPWD=`pwd`
cd /tmp
# make sure our temporary directory is empty
rm -rf temporary32build_cache
mkdir temporary32build_cache
cd temporary32build_cache

# clone the github repo
git clone "${GIT_REPO}"
# enter the repo, this feels a bit hacky
cd ./*
# pwd

# build the "inner" container and push it
# login with the host credentials now mounted in /root/.docker
# and push
docker build . -t "${D_TAG}" && \
docker login && \
docker push "${D_TAG}"

# clean up
cd /tmp
rm -rf temporary32build_cache

# return ...if it matters
cd "${_OLDPWD}"
# pwd
unset _OLDPWD

# debug "print", volume setup ok?
# ls -la /root/

