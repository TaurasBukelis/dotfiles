#urxvt -name urxvtfloat -bg '#00ff00' -e bash -c "neofetch && scrot -u /tmp/neofetch.png"; convert /tmp/neofetch.png -background none -fuzz 25% -transparent '#00ff00' -threshold 0 -background 'rgba(0,0,0,0.4)' -alpha remove /tmp/neofetch.png

color='#000000'
location=/tmp/neofetch.png
fuzz="10%"

urxvt -name urxvtfloat -bg $color -e \
    bash -c "neofetch && scrot -u $location"; \
    convert $location -background none -fuzz $fuzz -transparent $color \
    -background 'rgba(0,0,0,0.4)' -alpha remove \
    $location
