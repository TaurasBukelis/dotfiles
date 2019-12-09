#!/bin/sh
ping -c 5 -b 10.0.0.255 2> /dev/null | grep 'bytes from' | awk '{ print $4 }' | sort | uniq

