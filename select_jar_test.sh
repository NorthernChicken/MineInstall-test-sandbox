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

validate_url() {
    if [[ "$1" =~ ^https?://.*\..* ]]; then
        return 0
    else
        return 1
    fi
}

select_jar() {
    server_link=$(dialog --help-button \
        --inputbox "Enter link to server.jar" 0 0  \
        3>&1 1>&2 2>&3 3>&-)
    exit_code=$?
    clear
    if [ $exit_code -eq 0 ]; then
        if validate_url "$server_link"; then
            echo "Entered URL: $server_link"
        else
            dialog --infobox "Invalid URL." 0 0
            sleep 2
            clear
            exit_code=2
        fi
    elif [ $exit_code -eq 1 ]; then
        echo "Canceled"
    elif [ $exit_code -eq 2 ]; then
        select_jar_help
    fi
}

select_jar_help() {
    dialog --title "Help" \
        --msgbox "To find the server.jar download link, navigate to the download page of your desired server software and copy the URL of the download link or button." 0 0 
}

download_method_selector