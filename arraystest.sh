#!/bin/bash

# Declare associative arrays
declare -A vanilla_links
declare -A paper_links
declare -A spigot_links
declare -A purpur_links

# Populate the associative arrays
vanilla_links=(
    [1.20.6]="https://piston-data.mojang.com/v1/objects/145ff0858209bcfc164859ba735d4199aafa1eea/server.jar"
    [1.20.5]="https://piston-data.mojang.com/v1/objects/79493072f65e17243fd36a699c9a96b4381feb91/server.jar"
    [1.20.4]="https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar"
)

paper_links=(
    [1.20.6]="https://api.papermc.io/v2/projects/paper/versions/1.20.6/builds/28/downloads/paper-1.20.6-28.jar"
    [1.20.5]="https://api.papermc.io/v2/projects/paper/versions/1.20.5/builds/22/downloads/paper-1.20.5-22.jar"
    [1.20.4]="https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/496/downloads/paper-1.20.4-496.jar"
)

spigot_links=(
    [1.20.6]="https://download.getbukkit.org/spigot/spigot-1.20.6.jar"
    [1.20.5]="SPIGOT_NOT_SUPPORTED"
    [1.20.4]="https://download.getbukkit.org/spigot/spigot-1.20.4.jar"
)

purpur_links=(
    [1.20.6]="https://api.purpurmc.org/v2/purpur/1.20.6/2207/download"
    [1.20.5]="PURPUR_NOT_SUPPORTED"
    [1.20.4]="https://api.purpurmc.org/v2/purpur/1.20.4/2176/download"
)

# Function to get the download link
get_link() {
    local version=$1
    local type=$2

    case $type in
        vanilla)
            echo "${vanilla_links[$version]}"
            ;;
        paper)
            echo "${paper_links[$version]}"
            ;;
        spigot)
            echo "${spigot_links[$version]}"
            ;;
        purpur)
            echo "${purpur_links[$version]}"
            ;;
        *)
            echo "Invalid type specified"
            ;;
    esac
}

get_version() {
    server_version=$(dialog --cancel-label "Custom server.jar" \
        --menu "Select a Minecraft Version:" 0 0 0 \
        88 "1.20.6 (Latest)" \
        87 "1.20.5" \
        86 "1.20.4" \
        85 "1.20.3" \
        84 "1.20.2" \
        83 "1.20.1" \
        82 "1.20" \
        81 "1.19.4" \
        80 "1.19.3" \
        79 "1.19.2" \
        78 "1.19.1" \
        77 "1.19" \
        76 "1.18.2" \
        75 "1.18.1" \
        74 "1.18" \
        73 "1.17.1" \
        72 "1.17" \
        71 "1.16.5" \
        70 "1.16.4" \
        69 "1.16.3" \
        68 "1.16.2" \
        67 "1.16.1" \
        66 "1.16" \
        65 "1.15.2" \
        64 "1.15.1" \
        63 "1.15" \
        62 "1.14.4" \
        61 "1.14.3" \
        60 "1.14.2" \
        59 "1.14.1" \
        58 "1.14" \
        57 "1.13.2" \
        56 "1.13.1" \
        55 "1.13" \
        54 "1.12.2" \
        53 "1.12.1" \
        52 "1.12" \
        51 "1.11.2" \
        50 "1.11.1" \
        49 "1.11" \
        48 "1.10.2" \
        47 "1.10.1" \
        46 "1.10" \
        45 "1.9.4" \
        44 "1.9.3" \
        43 "1.9.2" \
        42 "1.9.1" \
        41 "1.9" \
        40 "1.8.9" \
        39 "1.8.8" \
        38 "1.8.7" \
        37 "1.8.6" \
        36 "1.8.5" \
        35 "1.8.4" \
        34 "1.8.3" \
        33 "1.8.2" \
        32 "1.8.1" \
        31 "1.8" \
        30 "1.7.10" \
        29 "1.7.9" \
        28 "1.7.8" \
        27 "1.7.7" \
        26 "1.7.6" \
        25 "1.7.5" \
        24 "1.7.4" \
        23 "1.7.3" \
        22 "1.7.2" \
        21 "1.6.4" \
        20 "1.6.2" \
        19 "1.6.1" \
        18 "1.5.2" \
        17 "1.5.1" \
        16 "1.5" \
        15 "1.4.7" \
        14 "1.4.6" \
        13 "1.4.5" \
        12 "1.4.4" \
        11 "1.4.2" \
        10 "1.3.2" \
        9 "1.3.1" \
        8 "1.2.5" \
        7 "1.2.4" \
        6 "1.2.3" \
        5 "1.2.2" \
        4 "1.2.1" \
        3 "1.1" \
        2 "1.0.1" \
        1 "1.0" \
        3>&1 1>&2 2>&3 3>&-) && clear
    if [ $? -eq 1 ]; then
        server_version="custom"
    fi
}

get_software() {
    if [ "$server_version" = "custom" ]; then
        jar_link=$(dialog \
            --inputbox "Enter URL to custom server.jar:" 0 0 \
            3>&1 1>&2 2>&3 3>&-) && clear
    else
        while true; do
            server_software=$(dialog --no-cancel --help-button \
                --menu "Select which server software to use:" 0 0 0 \
                4 "Vanilla" \
                3 "Paper" \
                2 "Spigot" \
                1 "Purpur" \
                3>&1 1>&2 2>&3 3>&-) && clear
            
            if [[ "$server_software" = HELP* ]]; then
                display_help
            else
                break
            fi
        done
    fi
}

get_version
get_software

if [ "$server_version" = "custom" ]; then
    echo "Custom jar link: $jar_link"
else
    link=$(get_link $server_version $server_software)
    echo "Download link for $server_software version $server_version: $link"
fi
