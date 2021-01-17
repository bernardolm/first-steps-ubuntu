#!/bin/bash

source $BASE_PATH/msg.sh

msg_init 'todo.txt-cli'

if [[ "$(command -v todo.sh)" == "" ]]; then
    version="2.12.0"
    curl -s -L https://github.com/todotxt/todo.txt-cli/releases/download/v$version/todo.txt_cli-$version.zip -o ~/tmp/todo.zip
    unzip ~/tmp/todo.zip -d ~/tmp/todo
    yes | mv ~/tmp/todo/todo.txt_cli-$version.dirty/todo.sh $SYNC_PATH/bin
    yes | mv ~/tmp/todo/todo.txt_cli-$version.dirty/todo_completion $SYNC_PATH/todo_txt
fi

msg_end 'todo.txt-cli'