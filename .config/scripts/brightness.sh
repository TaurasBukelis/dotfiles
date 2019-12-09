#!/bin/bash

max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
current=$(cat /sys/class/backlight/intel_backlight/brightness)
echo "Brightness - Current: $current Maximum: $max"
