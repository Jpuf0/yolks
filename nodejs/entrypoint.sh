#!/bin/bash
cd /home/container

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

node -v

MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

eval ${MODIFIED_STARTUP}
