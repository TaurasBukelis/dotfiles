#!/bin/bash

# Chech if arguments are passed
if [ $# -eq 0 ]; then
	echo "no arguments passed"
	exit 1
fi

# Current desktop/monitor
currDesk=$(bspc query -D -d focused --names)
currMon=$(bspc query -M -m focused --names)

# Check if trying to switch to current desktop
if [ $1 == $currDesk ]; then
	exit 0
fi

# Switch to or create a desktop
bspc query -D -d $1 &>/dev/null
if [ $? -ne 0 ]; then
	bspc monitor -a $1
fi
bspc desktop -f $1

# Clean empty desktops on current monitor
#for desktop in $(bspc query -D -m focused --names); do
#	if [ $1 == $desktop ]; then
#		continue
#	fi
#	bspc query -N -d $desktop &>/dev/null
#	if [ $? -eq 1 ]; then
#		bspc desktop $desktop -r
#	fi
#done

# If the last desktop is no longer needed - remove it
#if [ $currMon == $(bspc query -M -m focused --names) ]; then
#	bspc query -N -d $currDesk &>/dev/null
#	if [ $? -eq 1 ]; then
#		bspc desktop $currDesk -r
#		echo $currMon
#	fi
#fi

# Clean empty desktops
#for desktop in $(bspc query -D --names); do
#	if [ $desktop -ne $1 ]; then
#		bspc query -N -d $desktop &>/dev/null
#		if [ $? -ne 0 ]; then
#			bspc desktop $desktop -r
#		fi
#	fi
#done
