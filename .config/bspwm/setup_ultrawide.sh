#!/bin/bash

INTERNAL_MONITOR="eDP-1"
EXTERNAL_MONITOR="HDMI-1-1"

xrandr --output "$INTERNAL_MONITOR" --primary --mode 1920x1080 --pos 0x0 --rotate normal --output "$EXTERNAL_MONITOR" --mode 2560x1080 --pos 1920x0 --rotate normal

if [[ $(bspc query -D -m $EXTERNAL_MONITOR | wc -l) -lt 5 ]]; then
  for desktop in $(bspc query -D --names -m "$INTERNAL_MONITOR" | sed 5q); do
    bspc desktop "$desktop" --to-monitor "$EXTERNAL_MONITOR"
  done
fi
feh --bg-scale $HOME/images/zelda2.jpg

