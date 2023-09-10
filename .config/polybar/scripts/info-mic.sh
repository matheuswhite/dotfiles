#!/bin/bash

if pacmd list-sources 2>&1 | grep -q RUNNING; then
   mic="󰍬"
fi

echo "$mic"
