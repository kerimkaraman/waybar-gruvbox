#!/bin/bash

if ! playerctl -l | grep -q .; then
  echo "⏹️ Hiçbir şey çalmıyor"
  exit 0
fi

status=$(playerctl status 2>/dev/null)

if [[ "$status" == "Stopped" ]]; then
  echo "⏹️ Hiçbir şey çalmıyor"
  exit 0
fi

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

icon=""
if [[ "$status" == "Playing" ]]; then
  icon="▶️"
elif [[ "$status" == "Paused" ]]; then
  icon="⏸️"
fi

echo "$icon $artist - $title"
