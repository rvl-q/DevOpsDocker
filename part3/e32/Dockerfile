FROM docker:git

WORKDIR /usr/app

COPY container_builder.sh .

ENV GIT_REPO=
ENV D_USER=
ENV D_TAG=

CMD [ "sh", "container_builder.sh" ]