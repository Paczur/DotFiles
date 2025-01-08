#!/bin/env bash
# exec "/usr/bin/awm-test" >> /tmp/awm-out 2>&1
# exit 0

if [ "$1" = "/usr/bin/awm" ]; then
  /home/paczur/Scripts/system/startup/afterX
fi

# (exec i3) &> ~/System/Logs/i3
echo "$1" > /home/paczur/Build/option

log_dir="/home/paczur/Projects/C/awm/log"
mkdir "$log_dir"

while :; do
  exec "$1"
done
