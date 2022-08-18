#!/usr/bin/env bash

## Author : OSITO326
## Github : @OSITO326
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-5     style-7

dir="$HOME/.config/rofi/theme/launcher"
#theme='style-5'
theme='style-1'
#theme='style-7'

## Run
rofi \
    -modi emoji -show emoji -emoji-format '{emoji} <span weight="bold">{name}</span>[ <span size="small">({keywords})</span>]' \
    -theme ${dir}/${theme}.rasi
