#!/bin/bash

xrandr --output HDMI-0 --mode 1920x1080 --left-of LVDS-1-1

if ! xrandr -q | grep -qE "VGA-1-1 connected \("; then
    xrandr --output VGA-1-1 --left-of HDMI-0
fi
