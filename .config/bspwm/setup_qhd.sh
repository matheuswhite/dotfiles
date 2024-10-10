#!/bin/bash

INTERNAL_MONITOR="eDP-1"
EXTERNAL_MONITOR="HDMI-1-1"

xrandr --output "$INTERNAL_MONITOR" --mode 1920x1080 --pos 2560x0 --rotate normal --output "$EXTERNAL_MONITOR" --primary --mode 2560x1440 --pos 0x0 --rotate normal

if [[ $(bspc query -D -m $EXTERNAL_MONITOR | wc -l) -lt 5 ]]; then
  for desktop in $(bspc query -D --names -m "$INTERNAL_MONITOR" | sed 5q); do
    bspc desktop "$desktop" --to-monitor "$EXTERNAL_MONITOR"
  done
fi

feh --bg-scale ~/images/snow.jpg
