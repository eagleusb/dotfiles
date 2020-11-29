#!/usr/bin/env bash

set -e

waitingCount=0

if [[ $(pgrep -c polybar) -gt 0 ]]; then
  logger -p user.info "polybar: killing previous polybar instances"
  pkill "polybar"
fi;

logger -p user.info "polybar: lanching polybar for each screen"

while [[ $(xrandr --listmonitors | grep -cP '(HDMI\d+$|eDP\d+$)') -eq 0 ]]; do
  $((waitingCount++))
  logger -p user.info "polybar: waiting for xrandr monitor(s) (${waitingCount}x5sec)"
  sleep 5
  [[ $waitingCount -ge 5 ]] || break;
done

xrandr --listmonitors | \
  grep -oP '(HDMI\d+$|eDP\d+$)' | \
  xargs -P1 -I{} sh -c "sleep 5 && (MONITOR={} polybar -q -r p00 &) && logger -p user.info 'polybar: {} instance launched'"
