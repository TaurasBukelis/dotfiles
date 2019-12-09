#!/bin/bash
# Cleanup
killall 'bspc subscribe'

# Remove empty desktops
bspc subscribe desktop_focus | while read event monitor desktop; do
	for de in $(bspc query -D -m $monitor); do
		if [ $de == $desktop ]; then
			continue
		else
			bspc query -N -d $de &>/dev/null
			if [ $? -eq 1 ]; then
				bspc desktop $de -r
			fi
		fi
	done
done &

# Populate new monitors
bspc subscribe monitor_add | while read event monitor_id monitor_name geometry; do
	echo $monitor_name
	for i in {1..9}; do
		bspc query -D -d $i &>/dev/null
		if [ $? -ne 0 ]; then
			echo $i
			bspc monitor $monitor_id -d $i
			break
		fi
	done
done &
