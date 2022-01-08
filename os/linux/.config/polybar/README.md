![logo](https://github.com/OSITO326/dotfiles/blob/main/assets/dotfiles.png)
---

## Info
- OS: Arch Linux
- Web: Firefox
- Terminal: Kitty
- WM: bspwm
- shell: zsh
- Launcher: Rofi
- Bar: Polybar -> **`polybar-git`** install via AUR
- Notification Daemon: Dunst
- Compositor: picom
- Editor: NVIM
- Colors: Gruvbox
- GTK3: Gruvbox-Material-Dark
- Icons: Gruvbox-Material-Dark
- Icons Mouse: Volantes Cursors
- Keybindings: sxhkd
- Lockscreen: 
  - Betterlockscreen
  - lightdm with theme aether
- Fonts:
  - FiraCode Nerd Font
  - Iosevka Nerd Font
  - Awesome 6 Pro

---
## Dependencies

Install following programs on your system before you use these themes.

- Packages AUR
  - polybar-git
  - bspwm-git
  - lightdm-webkit-theme-aether
  - sxhkd-git
  - picom-ibhagwan-git
  - rofi-greenclip
  - rofi-power-menu
  - zscroll-git and playerctl via pacman

All this programs you can install via yay.

## Install fonts

### Manual Installation

- For a single user, install fonts to 
```bash
 ~/.local/share/fonts/
```
- For system-wide (all-users) installation, place your fonts under
```bash
/usr/local/share/fonts/
```

- Update the fontconfig cache (usually unnecessary as software using the fontconfig library does this)
```bash
$ fc-cache
```

## Add another bar

To have two polybar bars, one on each monitor, it is necessary to modify the file inside the folder:
~/.config/polybar/launch.sh
Add this line.

```bash
polybar -q another -c "$DIR"/config.ini &
```
## Add second polybar

In this case, if you add another polybar for third monitor. Check name for third monitor use this command.

```bash
$ polybar -M | cut -d ':' -f 1
```

```bash

[bar/another]
monitor = ${env:MONITOR:HDMI2} ;name the third adapter monitor
monitor-falbak = 
monitor-strict = false
override-redirect = false
bottom = false
fixed-center = true

width = 99.5%
height = 21

offset-x = 0.25%
offset-y = 0.5%

;background = ${color.background}
background = ${color.alpha}
foreground = ${color.foreground}

radius-top = 0
radius-bottom = 0

underline-size = 0
underline-color = ${color.foreground}

;border-size = 6
border-size = 0
border-color = ${color.background}
padding = 0

module-margin-left = 0
module-margin-right = 0

; Fonts
include-file = ~/.config/polybar/configs/fonts.ini

modules-left = left bspwm right sep-transparent left title right
;modules-center = left spotify-prev spotify-play-pause spotify-next sep spotify right
modules-center =  
modules-right = left weather right sep-transparent left redshift right sep-transparent left keyboard right sep-transparent left network sep vpn sep memory sep filesystem sep filesystem_home sep date right

separator = 
dim-value = 1.0
wm-name = 
locale = 

tray-position = none
tray-detached = false
tray-maxsize = 14
tray-background = ${color.background}
tray-offset-x = 0
tray-offset-y = 0
tray-padding = 0
tray-scale = 1.0

wm-restack = bspwm
enable-ipc = true
click-left =
click-middle =
click-right =
scroll-up =
scroll-down =
double-click-left =
double-click-middle =
double-click-right =
cursor-click =
cursor-scroll =
```

## Change the fonts in the modules

Change all fonts in this path, 
```bash
~/.config/polybar/configs/fonts.ini
```
If you are copying the settings for use with 2 monitors, do not touch anything and just follow the steps to add the fonts. It should work if you copied everything and followed the steps to install the fonts.

```
;Text Fonts
font-0 = "FiraCode Nerd Font:Regular:antialias=true:pixelsize=10;4"
;Icons Fonts
font-1 = "Iosevka Nerd Font:pixelsize=13;4"
font-2 = "Font Awesome 6 Pro:style=Solid:pixelsize=11;2.5"
font-3 = "Font Awesome 6 Pro:style=Solid:pixelsize=11;1"
font-4 = "Font Awesome 6 Brands:style=Regular:pixelsize=11;2.5"
;Powerline Glyphs for separators glyphs
font-5 = "FiraCode Nerd Font:pixelsize=16;3.5"
;Icons Fonts Duotone
font-6 = "Font Awesome 6 Duotone Solid:style=Solid:pixelsize=11;2.5"
;Icons Fonts Awesome 6 Pro Regular
font-7 = "Font Awesome 6 Pro:style=Regular:pixelsize=11;2.5"
font-8 = "Font Awesome 6 Pro:style=Light:pixelsize=11;2.5"
```

## Add/Remove modules

To be able to change the modules and modify to your liking, just modify these lines in the **config.ini** .
```bash
nvim ~/.config/polybar/configs/config.ini
```
Change this lines to the modules you want:

```bash
modules-left = left bspwm right sep-transparent left title right
modules-center = left updates sep info-trash right sep-transparent left-docker docker right
modules-right = left redshift right sep-transparent left keyboard right sep-transparent left network sep vpn sep memory sep filesystem sep filesystem_home sep date right
```
Take into account that each configuration of the modules is independent of each other **[bar/main]** and **[bar/secondary]**

## Module configuration

To configure the modules and they can work correctly on your computer, it is necessary to take some time and read in which lines you have to configure with the values of the computer, example. (**network** module -> replace by the values of your ethernet interface).

- **modules.ini**: modules that come by [default polybar](https://github.com/polybar/polybar/wiki). Path: ~/.config/polybar/configs/modules.ini
- **modules.ini**: []()Path: ~/.config/polybar/configs/modules.ini

Example configure **modules.ini -> [module/network]**

```bash
nvim ~/.config/polybar/configs/modules.ini
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
  <img src="https://github.com/OSITO326/dotfiles/blob/main/assets/custom_module.png">
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
type = custom/script

exec = ~/.config/polybar/scripts/vpn.sh
tail = true
interval = 2

format = <label>
;format-prefix = "異"
;format-prefix-font = 2
format-prefix = ""
format-prefix-font = 8 ;If you will use different fonts for the "Glyphs" icons, change the number according to the order of the fonts.ini file. As can be seen in the 2 lines above 
format-prefix-background = ${color.shade}
format-prefix-foreground = ${color.purple-light}

label = " %output%"
label-background = ${color.shade}
label-foreground = ${color.foreground}
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

