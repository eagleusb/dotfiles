#!/bin/env bash

killall -q polybar

while pgrep -x polybar>/dev/null; do sleep 1; done

if type "xrandr">/dev/null; then
  echo "Lanching polybar for each screen"
  xrandr --listactivemonitors | grep -oP '(HDMI\-\d+$|eDP\-\d+$)' | xargs -P1 -I{} bash -c "MONITOR={} polybar -q -r p00 &"
fi

