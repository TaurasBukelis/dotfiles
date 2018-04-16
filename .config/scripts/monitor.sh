#!/bin/bash

answer=$(xrandr -q | grep " connected" | cut -d" " -f1 | dmenu -i -p "Toggle Monitors:")
if [ -z $answer ]
then
    exit 0
fi

if xrandr -q | grep -Eq "$answer connected \(|$answer connected primary \("; then
    # OFF
    #echo "off"
    #xrandr --output $answer --auto
    #cat ./monitors/HDMI-0.sh
    #./monitors/$answer.sh
    ~/.config/scripts/monitors/$answer.sh
else
    # On
    #echo "on"
    xrandr --output $answer --off
fi
feh --bg-fill ~/.config/i3/wallpaper.jpg
~/.config/polybar/launch.sh
