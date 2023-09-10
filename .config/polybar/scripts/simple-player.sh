#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

max_artist_len=15
max_title_len=25

artist=$(playerctl metadata artist 2> /dev/null)
if [ ${#artist} -gt $max_artist_len ]; then
    artist="${artist:0:$max_artist_len}…"
fi

title=$(playerctl metadata title 2> /dev/null)
if [ ${#title} -gt $max_title_len ]; then
    title="${title:0:$max_title_len}…"
fi

if [[ "$player_status" = "Playing" ]]; then
    echo "playing"
    echo " $artist | $title"
elif [[ "$player_status" = "Paused" ]]; then
    echo "paused"
    echo " $artist | $title"
else 
    echo " Sem música"
fi
