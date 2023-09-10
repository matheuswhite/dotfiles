#!/bin/sh

lang=$(setxkbmap -query | grep "layout:")
lang=${lang:(-2):2}

if [[ "$lang" == "br" ]]; then
  echo "Changing keyboard to US ..."
  setxkbmap us
else
  echo "Changing keyboard to BR ..." 
  setxkbmap br
fi
