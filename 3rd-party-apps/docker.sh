#!/bin/bash

source $BASE_PATH/msg.sh

msg_init 'docker'

if [[ "$(command -v docker)" == "" ]]; then
    sudo apt-get install --yes docker-ce docker-ce-cli containerd.io
    [ `/bin/cat /etc/group | grep docker | wc -l | bc` -eq 0 ] && sudo groupadd docker && newgrp docker
    [ `getent group docker | grep $USER | wc -l | bc` -eq 0 ] && sudo usermod -aG docker $USER
fi

msg_end 'docker'
