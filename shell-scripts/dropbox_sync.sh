function dropbox_sync() {
    wait_for=5m

    echo -e "running dropbox-worker..."
    notify-send "dropbox-worker" "running..."

    dropbox start

    echo -e "giving $wait_for to dropbox work..."
    sleep $wait_for

    dropbox stop

    echo -e "finish dropbox-worker"
    notify-send "dropbox-worker" "finish"
}
