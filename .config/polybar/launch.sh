#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
# polybar example &
if type "xrandr"; then
    for m in $(xrandr -q | grep -E ' connected [0-9]| connected primary [0-9]' | cut -d" " -f1); do
        MONITOR=$m polybar --reload example &
    done
else
    polybar -reload example &
fi

# xrandr -q | grep -Eq "$answer connected \(|$answer connected primary \("
