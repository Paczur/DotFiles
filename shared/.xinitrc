#!/bin/env bash

/home/paczur/Scripts/system/startup/afterX

# (exec i3) &> ~/System/Logs/i3

log_dir="/home/paczur/Projects/C/awm/log"
mkdir "$log_dir"
while :; do
  exec "/usr/bin/awm"
#  (exec "/usr/bin/awm") &>> "$log_dir/$(date "+%d-%m-%y.%H:%M:%S").log"
done
