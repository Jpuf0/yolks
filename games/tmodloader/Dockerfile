FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian

LABEL       author="Torsten Widmann" maintainer="info@goover.de"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt upgrade -y \
            && apt install -y apt-transport-https wget iproute2 \
            && wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
            && dpkg -i packages-microsoft-prod.deb \
            && rm packages-microsoft-prod.deb \
            && apt update -y \
            && apt install -y aspnetcore-runtime-6.0 libgdiplus  
            
RUN         sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list
RUN         apt install dpkg -y
RUN         dpkg --add-architecture i386
RUN         apt update 
RUN         apt install -y lib32gcc-s1    
RUN         apt install -y lib32stdc++6 
RUN         apt install -y libc6-i386
RUN         apt install -y libcurl4-gnutls-dev:i386
RUN         apt install -y libsdl2-2.0-0:i386

RUN         apt-get install -y steamcmd

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
