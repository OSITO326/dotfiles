## Dependencies

Install following programs on your system before you use these themes.

- **`polibar-git`**: Ofcourse, the bar itselft.
- **`siji-git`**: Extra fonts.
- **`ttf-unifont`**: Extra fonts.

All this programs you can install via yay.

## Install themes for polybar

[Check this Repo](https://github.com/adi1090x/polybar-themes)

## Set theme 

Set theme forest in polybar with the following line, into bspwmrc:

```bash
bash ~/.config/polybar/launch.sh --forest
```
I will use that theme as an example, since I configured it with the necessary modules and added a new module.

## Use polybar in dual monitor

To have two polybar bars, one on each monitor, it is necessary to modify the file inside the folder:
With the lines that we add, the file should be as follows. This will cause a second module to be added for the second screen 
In my case, I use neovim:
```bash
nvim ~/.config/polybar/launch.sh
```

if possible delete the code and copy/paste the following code. 

```bash
#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	if [[ "$style" == "hack" || "$style" == "cuts" ]]; then
		polybar -q top -c "$dir/$style/config.ini" &
		polybar -q bottom -c "$dir/$style/config.ini" &
	elif [[ "$style" == "pwidgets" ]]; then
		bash "$dir"/pwidgets/launch.sh --main
	else
		#👇 👉 launching multiple monitors --> make sure to add monitor = ${env:MONITOR:} in the config
		if type "xrandr"; then
		  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		    eDP1=$m polybar -q main -c "$dir/$style/config.ini" &
		    HDMI1=$m polybar -q secondary -c "$dir/$style/config.ini" &
		  done
		else
		  polybar -q main -c "$dir/$style/config.ini" &
			polybar -q secondary -c "$dir/config.ini" &
		fi
			polybar -q main -c "$dir/$style/config.ini" &	
			polybar -q secondary -c "$dir/config.ini" &
	fi
}

if [[ "$1" == "--material" ]]; then
	style="material"
	launch_bar

elif [[ "$1" == "--shades" ]]; then
	style="shades"
	launch_bar

elif [[ "$1" == "--hack" ]]; then
	style="hack"
	launch_bar

elif [[ "$1" == "--docky" ]]; then
	style="docky"
	launch_bar

elif [[ "$1" == "--cuts" ]]; then
	style="cuts"
	launch_bar

elif [[ "$1" == "--shapes" ]]; then
	style="shapes"
	launch_bar

elif [[ "$1" == "--grayblocks" ]]; then
	style="grayblocks"
	launch_bar

elif [[ "$1" == "--blocks" ]]; then
	style="blocks"
	launch_bar

elif [[ "$1" == "--colorblocks" ]]; then
	style="colorblocks"
	launch_bar

elif [[ "$1" == "--forest" ]]; then
	style="forest"
	launch_bar

elif [[ "$1" == "--pwidgets" ]]; then
	style="pwidgets"
	launch_bar

elif [[ "$1" == "--panels" ]]; then
	style="panels"
	launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme
		
	Available Themes :
	--blocks    --colorblocks    --cuts      --docky
	--forest    --grayblocks     --hack      --material
	--panels    --pwidgets       --shades    --shapes
	EOF
fi
```

## Add second bar

To have two polybar bars, one on each monitor, it is necessary to modify the file inside the folder:
~/.config/polybar/forest/launch.sh
Add this line.

```bash
polybar -q secondary -c "$DIR"/config.ini &
```
## Add second module


```bash
;; _-_-_-_-_-_-_-_-_-_-START BAR/SECONDARY_-_-_-_-_-_-_-_-_-_-_-_
[bar/secondary]
; Use either of the following command to list available outputs:
; If unspecified, the application will pick the first one it finds.
; $ polybar -m | cut -d ':' -f 1
; $ xrandr -q | grep " connected" | cut -d ' ' -f1
monitor = ${env:MONITOR:HDMI1}

; Use the specified monitor as a fallback if the main one is not found.
monitor-fallback =

; Require the monitor to be in connected state
; XRandR sometimes reports my monitor as being disconnected (when in use)
monitor-strict = false

; Tell the Window Manager not to configure the window.
; Use this to detach the bar if your WM is locking its size/position.
override-redirect = false

; Put the bar at the bottom of the screen
bottom = false

; Prefer fixed center position for the `modules-center` block
; When false, the center position will be based on the size of the other blocks.
fixed-center = true

; Dimension defined as pixel value (e.g. 35) or percentage (e.g. 50%),
; the percentage can optionally be extended with a pixel offset like so:
; 50%:-10, this will result in a width or height of 50% minus 10 pixels
width = 100%
height = 34

; Offset defined as pixel value (e.g. 35) or percentage (e.g. 50%)
; the percentage can optionally be extended with a pixel offset like so:
; 50%:-10, this will result in an offset in the x or y direction 
; of 50% minus 10 pixels
offset-x = 0%
offset-y = 0%

; Background ARGB color (e.g. #f00, #ff992a, #ddff1023)
background = ${color.background}

; Foreground ARGB color (e.g. #f00, #ff992a, #ddff1023)
foreground = ${color.foreground}

; Background gradient (vertical steps)
;   background-[0-9]+ = #aarrggbb
;;background-0 = 

; Value used for drawing rounded corners
; Note: This shouldn't be used together with border-size because the border 
; doesn't get rounded
; Individual top/bottom values can be defined using:
;   radius-{top,bottom}
radius-top = 0.0
radius-bottom = 0.0

; Under-/overline pixel size and argb color
; Individual values can be defined using:
;   {overline,underline}-size
;   {overline,underline}-color
line-size = 0
line-color = ${color.background}

; Values applied to all borders
; Individual side values can be defined using:
;   border-{left,top,right,bottom}-size
;   border-{left,top,right,bottom}-color
; The top and bottom borders are added to the bar height, so the effective
; window height is:
;   height + border-top-size + border-bottom-size
; Meanwhile the effective window width is defined entirely by the width key and
; the border is placed withing this area. So you effectively only have the
; following horizontal space on the bar:
;   width - border-right-size - border-left-size
border-bottom-size = 0
border-bottom-color = ${color.foreground}

; Number of spaces to add at the beginning/end of the bar
; Individual side values can be defined using:
;   padding-{left,right}
padding = 2

; Number of spaces to add before/after each module
; Individual side values can be defined using:
;   module-margin-{left,right}
module-margin-left = 1
module-margin-right = 1

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

; Fonts are defined using <font-name>;<vertical-offset>
; Font names are specified using a fontconfig pattern.
;   font-0 = NotoSans-Regular:size=8;2
;   font-1 = MaterialIcons:size=10
;   font-2 = Termsynu:size=8;-1
;   font-3 = FontAwesome:size=10
; See the Fonts wiki page for more details

font-0 = "Iosevka Nerd Font:size=10;4"
font-1 = "Iosevka Nerd Font:size=10;3"
font-2 = "feather:size=12;3"

; Modules are added to one of the available blocks
;   modules-left = cpu ram
;   modules-center = xwindow xbacklight
;   modules-right = ipc clock

modules-left = launcher sep workspaces sep cpu memory filesystem
modules-center = mpd sep date
modules-right = battery network sep volume brightness sep sysmenu

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

; The separator will be inserted between the output of each module
separator =

; Opacity value between 0.0 and 1.0 used on fade in/out
dim-value = 1.0

; Value to be used to set the WM_NAME atom
; If the value is empty or undefined, the atom value
; will be created from the following template: polybar-[BAR]_[MONITOR]
; NOTE: The placeholders are not available for custom values
wm-name = 

; Locale used to localize various module data (e.g. date)
; Expects a valid libc locale, for example: sv_SE.UTF-8
locale = 

; Position of the system tray window
; If empty or undefined, tray support will be disabled
; NOTE: A center aligned tray will cover center aligned modules
;
; Available positions:
;   left
;   center
;   right
;   none
;tray-position = none
tray-position = right

; If true, the bar will not shift its
; contents when the tray changes
tray-detached = false

; Tray icon max size
tray-maxsize = 16

; Background color for the tray container 
; ARGB color (e.g. #f00, #ff992a, #ddff1023)
; By default the tray container will use the bar
; background color.
tray-background = ${color.background}

; Tray offset defined as pixel value (e.g. 35) or percentage (e.g. 50%)
tray-offset-x = 0
tray-offset-y = 0

; Pad the sides of each tray icon
tray-padding = 0

; Scale factor for tray clients
tray-scale = 1.0

; Restack the bar window and put it above the
; selected window manager's root
;
; Fixes the issue where the bar is being drawn
; on top of fullscreen window's
;
; Currently supported WM's:
;   bspwm
;   i3 (requires: `override-redirect = true`)
;;wm-restack =

; Set a DPI values used when rendering text
; This only affects scalable fonts
; dpi = 

; Enable support for inter-process messaging
; See the Messaging wiki page for more details.
enable-ipc = true

; Fallback click handlers that will be called if
; there's no matching module handler found.
click-left = 
click-middle = 
click-right =
scroll-up =
scroll-down =
double-click-left =
double-click-middle =
double-click-right =

; Requires polybar to be built with xcursor support (xcb-util-cursor)
; Possible values are:
; - default   : The default pointer as before, can also be an empty string (default)
; - pointer   : Typically in the form of a hand
; - ns-resize : Up and down arrows, can be used to indicate scrolling
cursor-click = 
cursor-scroll = 

;; WM Workspace Specific

; bspwm
;;scroll-up = bspwm-desknext
;;scroll-down = bspwm-deskprev
;;scroll-up = bspc desktop -f prev.local
;;scroll-down = bspc desktop -f next.local

;i3
;;scroll-up = i3wm-wsnext
;;scroll-down = i3wm-wsprev
;;scroll-up = i3-msg workspace next_on_output
;;scroll-down = i3-msg workspace prev_on_output

;; _-_-_-_-_-_-_-_-_-_-END BAR/SECONDARY_-_-_-_-_-_-_-_-_-_-_-_
```

## Change the fonts in the modules

To change the fonts/size of the letters replace these lines in the file ~.config/polybar/forest/config.ini
Inside [bar/main] and [bar/secondary], **both modules are independent of themselves for the configurations (change font, add/remove modules)**

```
;Text Fonts
font-0 = "FiraCode Nerd Font:size=10;4"
;Icons Fonts
font-1 = "UbuntuMono Nerd Font:size=14;3"
;Powerline Glyphs
font-2 = "feather:size=12;3"
; Larger font size for bar fill icons
font-3 = "Iosevka Nerd Font:style=Medium:size=12;4"
; Smaller font size for shorter spaces
font-4 = "Iosevka Nerd Font:style=Medium:size=7;4"
```

## Add/Remove modules

To be able to change the modules and modify to your liking, just modify these lines in the **config.ini** .
```bash
nvim ~/.config/polybar/forest/config.ini
```
Change this lines to the modules you want:

```bash
original modules
modules-left = launcher sep workspaces sep cpu memory filesystem
modules-center = mpd sep date
modules-right = battery network sep volume brightness sep sysmenu
```
Take into account that each configuration of the modules is independent of each other **[bar/main]** and **[bar/secondary]**

## Module configuration

To configure the modules and they can work correctly on your computer, it is necessary to take some time and read in which lines you have to configure with the values of the computer, example. (**network** module-> replace by the values of your ethernet interface).

- **modules.ini**: modules that come by [default polybar](https://github.com/polybar/polybar/wiki). Path: ~/.config/polybar/forest/modules.ini
- **user_modules.ini**: []().Path: ~/.config/polybar/forest/user_modules.ini

Example configure **modules.ini -> [module/network]**

```bash
nvim ~/.config/polybar/forest/modules.ini
```
Example:

```bash
{module/network}
interface = enp8s0
```
Change enp8s0 with your network interface, If you do not know what interface you have, use the following command:

```bash
ifconfig
```

For the modules you want to put in the polybar **[bar/main]** and **[bar/secondary]** read the code of both files and configure with the values of your computer. Once you have decided which modules to use in both. 
- Check [this subsection](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/polybar#addremove-modules)

## Create your own module

<p align="center">
  <img src="https://github.com/OSITO326/dotfiles/blob/main/.screenshots/custom_module.png">
</p>

In my case I decided to create a module to show me the IP address of the VPN that I use through **openvpn**.
To create the following module, open the file **user_modules.ini**:

```bash
nvim ~/.config/polybar/forest/user_modules.ini
```
At the end of all the code you can add the following lines to create the vpn module or any custom one. 

```bash
; Module name 
[module/vpn]

; Type module
type = custom/script

; Iin the type of module I put that it will be a script, so I want it to execute the script 
exec = ~/.config/polybar/forest/scripts/vpn.sh &

; Will the script output continous content?
; Default: false
tail = true

; Seconds to sleep between updates
; Default: 2 (0 if `tail = true`)
interval = 2

; Available tags:
;   <output> - deprecated
;   <label> (default)
format = <label>
format-prefix = "異 "

; Available tokens:
;   %output%
; Default: %output%
format-prefix-foreground = ${color.pink}
label = " %output%"
```

the script you create contains the following:

```bash
#!/bin/sh
 
IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
 
if [ "$IFACE" = "tun0" ]; then
    echo "$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "N/A"
fi
```

- If you create a new script do not forget to give it write permissions with the command **chmod +x file.sh** so that it works correctly together with the module.
- once the module and the script have been created, all you have to do is add the module in the bar you want, both in **[bar/main]** or **[bar/secondary]**. Check [this subsection](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/polybar#addremove-modules)


> **Note**

To create other modules you want you can see the modules that are inside the **user_modules.ini** file and guide you with the modules since I did not find information about creating custom modules, I was guided with the ones that had and partly with the documentation of [polybar](https://github.com/polybar/polybar/wiki).

