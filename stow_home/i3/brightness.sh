#!/bin/bash

# Increase brightness
if [[ "$1" == "up" ]]; then
    xbacklight -inc 10
# Decrease brightness
elif [[ "$1" == "down" ]]; then
    xbacklight -dec 10
fi

