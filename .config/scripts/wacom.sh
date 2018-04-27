#!/bin/bash

ans=""
output=$(xdpyinfo -ext XINERAMA | grep "head" | cut -d" " -f4 | cut -b 2)

for line in $output; do
    if [ $line -eq 0 ]
    then
        ans="HEAD-$line"
    else
        ans="$ans\nHEAD-$line"
    fi
    #ans="$ans '\n' $line"
done

answer=$(echo -e "$ans" | dmenu -i -p "Choose display:")

if [ -z $answer ]
then
    exit 0
fi

xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" MapToOutput $answer
