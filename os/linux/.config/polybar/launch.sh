#!/usr/bin/env bash

# Add this script yo your wm startup file

DIR="$HOME/.config/polybar"

# Terminate already running bas instances
killall -q polybar
killall -q volumeicon
killall -q cbatticon
killall -q udiskie

# Wait intil the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR/configs/config.ini" &
polybar -q secondary -c "$DIR/configs/config.ini" &
