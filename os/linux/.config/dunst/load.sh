#!/bin/bash

#########################################
# SHAMELESS RIPOFF FROM ANOTHER GUY LUL #
#########################################

pkill dunst
dunst -config ~/.config/dunst/dunstrc &

user=$USER
notify-send -a Notification -u low "Hi $user!" -i "~/.config/dunst/icons/welcome.svg"
