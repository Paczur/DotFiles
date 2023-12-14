#!/bin/env bash
/home/paczur/Scripts/system/startup/afterX
modprobe -r i915
modprobe i915 i915.modeset=1
(exec i3) &> ~/System/Logs/i3
