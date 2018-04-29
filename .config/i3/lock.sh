#!/bin/bash

location=/tmp/wall.jpg

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ffffffff'  # default
T='#ffffffff'  # text
W='#9486A0ff'  # wrong
V='#E27B91ff'  # verifying

yoffset=150 #1000
boxh=80
boxw=300
yoffsetc=140 #936

rectangles=" "

sources=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
echo -e $sources

for res in $sources; do
    data=(${res//[x+]/ })
    centerx=$((${data[2]} + ${data[0]}/2))
    centery=$((${data[3]} + ${data[1]} - yoffset))
    rectangles+="rectangle $((centerx - boxw/2)),$((centery-boxh/2)) $((centerx + boxw/2)),$((centery + boxh/2)) "
done

echo -e $rectangles

scrot $location && convert $location -blur 16x8 -fill "rgba( 0, 0, 0, 0.4)" -draw "$rectangles" $location

~/.bin/i3lock-color/x86_64-unknown-linux-gnu/i3lock \
  -i $location \
  --clock \
  --timepos="x+w/2-40:y+h-$((yoffsetc))" \
  --datepos="tx:ty+15" \
  --indpos="x+w/2 + 100:y+h-$((yoffsetc))" \
  --radius=20 --ring-width=3 \
  --indicator \
  --insidevercolor=fecf4dff \
  --insidewrongcolor=d23c3dff \
  --insidecolor=00000000 \
  --ringvercolor=ffffffff \
  --ringwrongcolor=ffffffff  \
  --ringcolor=ffffffff \
  --separatorcolor=00000000 \
  --keyhlcolor=d23c3dff \
  --bshlcolor=d23c3dff \
  --line-uses-inside \
  --veriftext="" \
  --wrongtext="" \
  --timecolor=ffffffff \
  --datecolor=ffffffff \
  --modsize=8 \
  #--textcolor=ffffffff \
  #--datestr "Type password to unlock..." \

#./i3lock \
#~/.bin/i3lock-color/x86_64-unknown-linux-gnu/i3lock \
#--insidevercolor=$C   \
#--ringvercolor=$V     \
#\
#--insidewrongcolor=$C \
#--ringwrongcolor=$W   \
#\
#--insidecolor=$B      \
#--ringcolor=$D        \
#--linecolor=$B        \
#--separatorcolor=$D   \
#\
#--verifcolor=$T        \
#--wrongcolor=$T        \
#--timecolor=$T        \
#--datecolor=$T        \
#--layoutcolor=$T      \
#--keyhlcolor=$W       \
#--bshlcolor=$W        \
#\
#--screen 1            \
#--blur 5              \
#--clock               \
#--indicator           \
#--timestr="%H:%M:%S"  \
#--datestr="%A, %m %Y" \
#--keylayout 2         \

# If still locked after 5 seconds, turn off screen
sleep 5 && pgrep i3lock && xset dpms force off
