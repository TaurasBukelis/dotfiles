#!/bin/bash

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ffffffff'  # default
T='#ffffffff'  # text
W='#9486A0ff'  # wrong
V='#E27B91ff'  # verifying

# Lock screen
#i3lock -e --color "#000000"
#~/.bin/i3lock-color/x86_64-unknown-linux-gnu/lock.sh

#./i3lock \
~/.bin/i3lock-color/x86_64-unknown-linux-gnu/i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2         \

# If still locked after 5 seconds, turn off screen
sleep 5 && pgrep i3lock && xset dpms force off
