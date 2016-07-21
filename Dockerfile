FROM mhart/alpine-node

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.6.0

RUN     set -x \
    && apk add --no-cache \
    ca-certificates \
    curl \
    openssl \
    && curl -sL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION" \
    > /usr/bin/docker; chmod +x /usr/bin/docker

ADD lib /lib
ADD bin /bin




CMD ["node", "lib/che.js"]
