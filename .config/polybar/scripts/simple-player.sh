#!/bin/sh

repeatspace() {
    for i in $(seq $1); do echo -n " "; done
}

clamp() {
    val=$(( $1 > $3 ? $3 : $1))
    echo $(( $val < $2 ? $2 : $val ))
}

songtime() {
    printf '%.0f' $(echo $(playerctl position) | sed -r 's/\./,/g')
}

player_status=$(playerctl status 2> /dev/null)
artist=$(playerctl metadata artist 2> /dev/null)
title=$(playerctl metadata title 2> /dev/null)

time_to_start_slide=3
max_title_len=25
title_len=${#title}

if [[ $title_len -gt $max_title_len ]]; then
    offset=$(songtime)
    mod=$(expr $max_title_len - $title_len - 3 - $time_to_start_slide)
    
    title_start=$(expr $offset % $mod - $time_to_start_slide)
    title_start=$(clamp $title_start 0 $title_len)
    title="${title:$title_start:$max_title_len}"
    title_len=${#title}
    
fi

num_spaces=$(expr $max_title_len - $title_len)
spaces=$(repeatspace $num_spaces)
    
if [[ "$player_status" = "Playing" ]]; then
    echo "$artist | $title$spaces |"
elif [[ "$player_status" = "Paused" ]]; then
    echo "Pausado"
else 
    echo "Sem música"
fi
