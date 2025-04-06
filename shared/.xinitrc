#!/bin/env bash
# exec "/usr/bin/awm-test" >> /tmp/awm-out 2>&1
# exit 0

/home/paczur/Scripts/system/startup/afterX
exec xinit-loop "$1"
