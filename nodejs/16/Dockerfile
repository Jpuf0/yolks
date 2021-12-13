FROM      node:16-buster-slim

LABEL     author="Jpuf" maintainer="Jpuf@Jpuf.xyz"

RUN       apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3-dev ca-certificates dnsutils tzdata zip g++ make libc6 musl \
            && npm install -g node-gyp \
            && npm install --ignore-scripts=false --verbose \
            && npm install node-libpng \
            && useradd -m -d /home/container container

USER      container
ENV       USER=container HOME=/home/container
WORKDIR		/home/container

COPY      ./../entrypoint.sh /entrypoint.sh
CMD       ["/bin/bash", "/entrypoint.sh"]
