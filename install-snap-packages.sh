#!/bin/bash

source $BASE_PATH/msg.sh

msg_init 'snap packages'

[ -f ~/tmp/snap_packages ] || touch -d "2 years ago" ~/tmp/snap_packages

if test `find ~/tmp/snap_packages -mmin +180`; then
    sudo snap refresh

    sudo snap install \
        dbeaver-ce \
        glimpse-editor \
        postman \
        redis-desktop-manager \
        spotify \
        sweethome3d-homedesign \
        && true

    # classic snaps are not parallel installable yet
    sudo snap install --classic code
    sudo snap install --classic google-cloud-sdk
    sudo snap install --classic kubectl \

    touch ~/tmp/snap_packages
else
    echo "snap packages updated"
fi

msg_end 'snap packages'
