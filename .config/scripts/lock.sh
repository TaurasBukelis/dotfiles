#!/bin/bash

# Screenshot location
location=/tmp/wall.jpg

#Constants
yoffset=150     # Box offset from the bottom
boxh=80         # Box height
boxw=300        # Box width
yoffsetc=140    # yoffset * 0.936

#Colors
B='#00000000'   # Blank
W='#ffffffff'   # White
V='9486A0ff'    # Verify
R='E27B91ff'    # Segments and wrong

rectangles=" "

# Getting the info about monitors
sources=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')

# Calculating rectangle positions
for res in $sources; do
    data=(${res//[x+]/ })
    centerx=$((${data[2]} + ${data[0]}/2))
    centery=$((${data[3]} + ${data[1]} - yoffset))
    rectangles+="rectangle $((centerx - boxw/2)),$((centery-boxh/2)) $((centerx + boxw/2)),$((centery + boxh/2)) "
done

# Applying blur and drawing the rectangles
scrot $location && convert $location -blur 16x8 -fill "rgba( 0, 0, 0, 0.4)" -draw "$rectangles" $location

# Locking the screen
~/.bin/i3lock-color/x86_64-unknown-linux-gnu/i3lock \
    -e \
    -i $location \
    --clock \
    --timepos="x+w/2-40:y+h-$((yoffsetc))" \
    --datepos="tx:ty+15" \
    --indpos="x+w/2 + 100:y+h-$((yoffsetc))" \
    --verifpos="tx:ty+10" \
    --wrongpos="tx:ty+10" \
    --modifpos="tx:ty+20" \
    --veriftext="Verifying" \
    --wrongtext="Incorrect" \
    --noinputtext="" \
    --insidevercolor=$V \
    --insidewrongcolor=$R \
    --insidecolor=$B \
    --verifcolor=$W \
    --wrongcolor=$W \
    --ringvercolor=$W \
    --ringwrongcolor=$W  \
    --ringcolor=$W \
    --separatorcolor=$B \
    --keyhlcolor=$R \
    --bshlcolor=$R \
    --timecolor=$W \
    --datecolor=$W \
    --line-uses-inside \
    --radius=20 \
    --ring-width=3 \
    --indicator \
    --modsize=10 \
    #--textcolor=$W \
    #--datestr "Type password to unlock..." \

# If still locked after 5 seconds, turn off screen
sleep 5 && pgrep i3lock && xset dpms force off
