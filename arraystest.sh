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
  # Add more versions as needed
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

# Example usage
version="1.20.4"
type="purpur"

link=$(get_link $version $type)
echo "Download link for $type version $version: $link"
