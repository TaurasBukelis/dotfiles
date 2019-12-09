#!/bin/bash

#if [ $# -eq 0 ]
#then
#    urxvt -name urxvtfloat -e bash -c "bash -i"
#else
#    urxvt -name urxvtfloat -e bash -c "$1; bash -i"
#fi

if [ $# -eq 0 ]; then
	urxvt -name urxvtfloat
else
	if [ $1 -eq 0 ]; then
		urxvt -name urxvtfloat -e bash -c "$2"
	else
		urxvt -name urxvtfloat -e bash -c "$2; bash -i"
	fi
fi
