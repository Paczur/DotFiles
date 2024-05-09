#!/bin/env bash

/home/paczur/Scripts/system/startup/afterX

# (exec i3) &> ~/System/Logs/i3

dir="/home/paczur/Projects/C/awm"
mkdir "$dir/log"
while :; do
  (exec "$dir/bin/awm") &>> "$dir/log/$(date "+%d-%m-%y.%H:%M:%S").log"
done
