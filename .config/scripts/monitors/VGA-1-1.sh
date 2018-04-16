#!/bin/bash

if xrandr -q | grep -Eq "HDMI-0 connected primary \("; then
    xrandr --output VGA-1-1 --mode 1280x1024 --left-of LVDS-1-1 --rotate left
else
    xrandr --output VGA-1-1 --mode 1280x1024 --left-of HDMI-0 --rotate left
fi
