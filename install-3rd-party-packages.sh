#!/bin/bash

source $BASE_PATH/msg.sh

msg_init '3rd party packages'

sudo apt install --yes --no-install-recommends \
    balena-etcher-electron \
    gh \
    google-chrome-stable \
    google-cloud-sdk \
    kubectl \
    libreoffice-calc \
    nmap \
    python-gtk2 \
    stacer \
    sublime-text \
    wine-staging \
    wine-staging-amd64 \
    winehq-staging

if [[ `hostname` != "hunb*" ]]; then
    sudo apt install --yes --no-install-recommends \
        ungoogled-chromium
fi

sudo apt install -f --yes

msg_end '3rd party packages'
