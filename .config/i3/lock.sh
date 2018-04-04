#!/bin/bash

# Lock screen
i3lock -e --color "#000000"

# If still locked after 5 seconds, turn off screen
sleep 5 && pgrep i3lock && xset dpms force off
