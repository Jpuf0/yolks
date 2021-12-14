FROM      --platform=$TARGETOS/$TARGETARCH node:16-bullseye-slim

LABEL     author="Jpuf" maintainer="Jpuf@Jpuf.xyz"

RUN       apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip make tar curl build-essential libtool \
            && npm install -g npm@latest \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY      ./../entrypoint.sh /entrypoint.sh
CMD       ["/bin/bash", "/entrypoint.sh"]
