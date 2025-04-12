#!/bin/bash

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

icon="" 
if [[ $(playerctl status) == "Playing" ]]; then
  icon="▶️"
elif [[ $(playerctl status) == "Paused" ]]; then
  icon="⏸️"  
fi
echo "$icon $artist - $title"