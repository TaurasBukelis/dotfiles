#!/bin/bash

if [ $# -eq 0 ]
then
    urxvt -name urxvtfloat -e bash -c "bash -i"
else
    urxvt -name urxvtfloat -e bash -c "$1; bash -i"
fi
