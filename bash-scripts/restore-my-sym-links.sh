#!/bin/bash

timestamp=$(date +"%Y-%m-%d-%H-%M")

while read line; do
    # only to ZSH
    # paths=("${(@s/;/)line}")
    # from=${paths[1]}
    # to=${paths[2]}

    IFS=';' read -r -a paths <<< "$line"
    from=${paths[0]}
    to=${paths[1]}

    echo "from $from to $to"

    if [ ! -L $to ] ; then
        mv $to "$to-bkp-$timestamp"

        if [[ "$to" == "/home"* ]]; then
            ln -s $from $to
        else
            sudo ln -s $from $to
        fi
    else
        echo "$to already is a sym link"
    fi
done <$SYNC_PATH/scripts/my-sym-links.txt
