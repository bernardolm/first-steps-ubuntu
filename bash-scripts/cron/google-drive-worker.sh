#!/bin/bash

source ~/envs.sh

source $WORKSPACE_USER/first-steps-ubuntu/shell-scripts/google_drive_sync.sh

log_path=$USER_TMP/cron/google-drive-worker

if [ ! -d $log_path ]; then
    echo -e "creating google drive worker log folder '$log_path'..."
    mkdir -p $log_path
fi

google_drive_sync > $log_path/$(date +"%Y-%m-%d-%H-%M").log 2>&1
