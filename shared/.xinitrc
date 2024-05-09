#!/bin/env bash

/home/paczur/Scripts/system/startup/afterX

# (exec i3) &> ~/System/Logs/i3

log="/home/paczur/Projects/C/awm/log"
mkdir "$log"
while :; do
  (exec awm) &>> "$log/$(date "+%d-%m-%y.%H:%M:%S").log"
done
