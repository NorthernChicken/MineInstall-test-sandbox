#!/bin/bash

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

echo $server_version
echo $jar_link
echo $server_software