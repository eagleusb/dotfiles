#!/bin/env bash

set -e

if [[ $(pgrep -c redshift) -gt 0 ]]; then
  logger -p user.info "redshift: is already running, doing nothing"
  exit
else
  logger -p user.info "redshift: launching redshift instance"
  (redshift -c ${HOME}/.config/redshift/redshift.conf&>/dev/null &) && \
    logger -p user.info 'redshift: instance launched'
fi;
