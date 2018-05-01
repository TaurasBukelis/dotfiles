#!/bin/bash

stylus="Wacom Intuos PT S 2 Pen stylus"
pad="Wacom Intuos PT S 2 Pad pad"

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

# Maps to screen
xsetwacom --set "$stylus" MapToOutput $answer

# Buttons
xsetwacom --set "$pad" Button 1 "Key KP_Add"
xsetwacom --set "$pad" Button 3 "Key KP_Subtract"
xsetwacom --set "$pad" Button 8 "Key +ctrl z -ctrl"

# Fixed aspect ratio
xsetwacom --set "$stylus" Area 0 0 15200 8550
