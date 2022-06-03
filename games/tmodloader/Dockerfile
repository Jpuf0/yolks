FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian

LABEL       author="Torsten Widmann" maintainer="info@goover.de"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt upgrade -y \
            && apt install -y apt-transport-https wget iproute2 \
            && add-apt-repository multiverse -y \
            && dpkg --add-architecture i386 -y \
            && wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
            && dpkg -i packages-microsoft-prod.deb \
            && rm packages-microsoft-prod.deb \
            && apt update -y \
            && apt install -y aspnetcore-runtime-6.0 libgdiplus \
            && apt install -y lib32gcc-s1 steamcmd 

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
