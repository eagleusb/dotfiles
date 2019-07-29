#!/bin/env bash

set -e

# specs:
# xrandr --listactivemonitors 
# Monitors: 2
#  0: +*HDMI-2 1920/531x1080/298+1366+0  HDMI-2
#  1: +eDP-1 1366/277x768/156+0+0  eDP-1
#
# * means primary
# + means connected


getCurrentMonitor () {
  return /usr/bin/xrandr --listactivemonitors
}

setPrimary () {
  /usr/bin/xrandr --output ${1} --primary --auto
  echo -e "Monitor ${1} set as primary"
}

setDpi () {
  [[ ${#} == 2 ]] || { echo 'setDpi() takes only two arguments, exiting...'; return; }
  /usr/bin/xrandr --output ${1} --dpi ${2}
  echo -e "Monitor ${1} DPI set to ${2}"
}

isHdmiPresent() {
  local PATTERN_HDMI='\s+\+(\*)?HDMI\-2\s'
  if [[ $(getCurrentMonitor | grep -coE "${PATTERN_HDMI}") == 1 ]]; then
    return true
  fi
  return false
}

isEdpPresent() {
  PATTERN_EDP='\s+\+(\*)?eDP\-1\s'
}

isFullHd() {
  # TODO
  return
}


# main
if [[ isHdmiPresent ]]; then
  echo "HDMI monitor detected, setting it as primary..."
  setPrimary "HDMI-2"
else
  echo plap
fi

