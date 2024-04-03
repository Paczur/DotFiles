#!/bin/env bash

# /home/paczur/Scripts/system/startup/afterX
# (exec i3) &> ~/System/Logs/i3

setxkbmap pl -option caps:swapescape &
xsetroot -cursor_name left_ptr &
xset -dpms &
xset s off &
xinput --set-prop "SteelSeries SteelSeries Rival 110 Gaming Mouse" 'libinput Accel Profile Enabled' 0, 1 &

xrdb -merge ~/.Xresources &
feh --no-fehbg -B "#111111" --bg-center --geometry 1920x1080-1080+210 \
  "/home/paczur/Multimedia/Pictures/Seasonal/$(season)/wallpaper.png"
loc="/home/paczur/Projects/C/IdkWM/bin"
audio &
while :; do
  (exec "$loc/idkwm") &>> "$loc/out"
done
