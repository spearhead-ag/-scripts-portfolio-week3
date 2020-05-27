#!/bin/bash
#set -x

file="./filenames.txt"

while IFS= read -r line 
do
    if [ -f "$line" ]; then
        echo $line "- That file exists!"
    else 
        if [ -d "$line" ]; then
            echo $line "- That’s a directory."
        else
            echo $line "- I don't know what that is!"
        fi      
    fi
done <"$file"