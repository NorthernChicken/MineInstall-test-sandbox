#!/bin/bash

server_version="1.21.1"
exit_code=2

download_method_selector() {
    result=$(dialog --title "Server.jar download" \
        --menu "What Minecraft version would you like to download?" 0 0 0 \
        1 "Latest version (Vanilla $server_version)" \
        2 "Custom server software/version" \
        3>&1 1>&2 2>&3)
    clear
    if [ $? -eq 0 ]; then
        if [ "$result" -eq 1 ]; then
            echo "You selected the latest version: $server_version"
        elif [ "$result" -eq 2 ]; then
            while [ "$exit_code" = 2 ]; do
                select_jar
            done
        fi
    else
        echo "Dialog canceled or an error occurred."
    fi
}

select_jar() {
    :
}

download_method_selector