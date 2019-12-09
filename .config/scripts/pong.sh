#!/bin/bash
dx=3
dy=3

clear; neofetch

while true; do

	id=$(bspc query -N -d focused -n focused.window)
	pid=$(xprop -id $id | grep "_NET_WM_PID" | cut -d" " -f3)
	xdotool=$(xdotool search --pid $pid %1 getwindowgeometry 2> /dev/null)
	position=$(echo $xdotool | cut -d" " -f4)
	geometry=$(echo $xdotool | cut -d" " -f8)
	x=$(echo $position | cut -d"," -f1)
	y=$(echo $position | cut -d"," -f2)
	w=$(echo $geometry | cut -d"x" -f1)
	h=$(echo $geometry | cut -d"x" -f2)
	#echo $x $y
	#echo $w $h
	if [ $(($y+$dy+$h)) -gt "768" ]; then
		dy=$((-$dy))
	fi
	if [ $(($y+$dy)) -lt "0" ]; then
		dy=$((-$dy))
	fi

	if [ $(($x+$dx+$w)) -gt "1366" ]; then
		dx=$((-$dx))
	fi
	if [ $(($x+$dx)) -lt "0" ]; then
		dx=$((-$dx))
	fi
	bspc node $id -v $dx $dy
	#sleep 0.016
done
