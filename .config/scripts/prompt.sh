#!/bin/bash

if [ $# -eq 2 ]
then
    answer=$(echo -e "No\nYes" | dmenu -i -p "$1")

    if [ $answer == "Yes" ]
    then
        bash -c "$2"
    fi
else
    echo "Incorrect usage"
fi
