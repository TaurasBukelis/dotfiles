#!/bin/bash

# Lock screen
qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock

# If still locked after 20 seconds, turn off screen
sleep 20 && pgrep kscreenlocker && xset dpms force off
