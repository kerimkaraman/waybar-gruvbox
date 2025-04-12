#!/bin/bash

if ! playerctl -l | grep -q .; then
  echo "⏹️ Player is empty"
  exit 0
fi

status=$(playerctl status 2>/dev/null)

if [[ "$status" == "Stopped" ]]; then
  echo "⏹️ Player is stopped"
  exit 0
fi

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

maxlen=40

text="$artist - $title"

if [ ${#text} -gt $maxlen ]; then
  text="${text:0:$((maxlen - 3))}..."
fi

icon=""
if [[ "$status" == "Playing" ]]; then
  icon="▶️"
elif [[ "$status" == "Paused" ]]; then
  icon="⏸️"
fi

echo "$icon $text"
