#!/bin/bash

aspect=(15200 9500)
stylus="Wacom Intuos PT S 2 Pen stylus"
pad="Wacom Intuos PT S 2 Pad pad"

ans=""
output=$(xrandr -q | grep ' connected' | grep "[0-9][0-9]*x[0-9][0-9]*[^ ]*")

count=0
formated=""

while read -r line; do
    names[count]=$(echo $line -n | cut -d" " -f1)
    info[count]=$(echo $line -n | grep -o "[0-9][0-9]*x[0-9][0-9]*[^ ]*")
    formated="${formated}${names[count]}\n"
    count=$((count + 1))
done <<< $output

answer=$(echo -e $formated | dmenu -i -p "Choose display:")

if [ -z $answer ]
then
    exit 0
fi

found=false
id=0

for ((i=0;i<$count;i++))
do
    if [ $answer == ${names[$i]} ]
    then
        found=true
        id=$i
        break
    fi
done

# Maps to screen
xsetwacom --set "$stylus" MapToOutput ${info[$id]}

# Buttons
xsetwacom --set "$pad" Button 1 "Key KP_Add"
xsetwacom --set "$pad" Button 3 "Key KP_Subtract"
xsetwacom --set "$pad" Button 8 "Key +ctrl z -ctrl"

# Fixed aspect ratio
res=(${info[$id]//[x+]/ })

if [ $((res[0]*10)) -gt $((res[1]*16)) ]
then
    # Change the last one
    num=$(echo "${aspect[0]}*${res[1]}/${res[0]}" | bc)
    xsetwacom --set "$stylus" Area 0 0 ${aspect[0]} $num
else
    # Change the first one
    num=$(echo "${aspect[1]}*${res[0]}/${res[1]}" | bc)
    xsetwacom --set "$stylus" Area 0 0 $num ${aspect[1]}
fi

echo ${aspect[0]}
