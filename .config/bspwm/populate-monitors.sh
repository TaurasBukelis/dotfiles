#!/bin/bash

for monitor in $(bspc query -M --names); do
	bspc query -D -d Desktop -m $monitor &>/dev/null
	if [ $? -eq 0 ]; then
		for i in {1..9}
		do
			bspc query -D -d $i &>/dev/null
			if [ $? -ne 0 ]; then
				bspc monitor $monitor -d $i
				echo $monitor
				break
			fi
		done
	fi
done
