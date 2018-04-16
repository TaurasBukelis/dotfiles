#!/bin/bash

name="Intel PState"
turbo=$(cat /sys/devices/system/cpu/intel_pstate/no_turbo)
if [ $turbo == 0 ]
then
    echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo > /dev/null
    echo 60 | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct > /dev/null
    notify-send "$name" 'Underclocked successfully'
else
    echo 0 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo > /dev/null
    echo 100 | sudo tee /sys/devices/system/cpu/intel_pstate/max_perf_pct > /dev/null
    notify-send "$name" 'Overclocked successfully'
fi

