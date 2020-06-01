#!/bin/bash
#set -x

while true
do
    read -p "Type URL to download or type 'exit' to quit: " ans
    if [[ "$ans" == "exit" ]]; then
        echo $'\n'
        echo "Goodbye."
        exit 0
    fi
    read -p "Type the location where you want to download the file: " storage
    wget $ans -P ../$storage
done