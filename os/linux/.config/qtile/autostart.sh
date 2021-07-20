#!/bin/sh


# systray volume
volumeicon &
# systray battery icon
cbatticon -u 5 &

# Keymap layout dvorak programmer
#setxkbmap -layout us -variant dvp & #dvorak programmer
setxkbmap -layout us -variant dvorak-intl &
#setxkbmap -layout us -variant altgr-intl &
