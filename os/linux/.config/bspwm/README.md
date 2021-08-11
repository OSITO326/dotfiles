# BSPWM with Polybar

![View the final results](.screenshots/bspwm_polybar.png)
## Dependencies

Install following programs on your system before you use these themes.

- **`bspwm-git`**: Ofcourse, the bar itselft.
- **`sxhkd-git`**: Use keybindings (shortcuts).

All this programs you can install via yay.

- [BSPWM Repo](https://github.com/baskerville/bspwm)
- [sxhkd](https://github.com/baskerville/sxhkd)

## Use BSPWM

Give write permissions to the bspwmrc file with the following command:

```bash
bash chmod +x ~/.config/bspwm/bspwmrc
```

## Workspace BSPWM

Inside the bspwmrc file, in case of using a monitor you can add up to 10 workspaces.

to know the video port you use, use the command **xrandr** in the terminal:

```bash
xrandr --query | grep " connected" | cut -d" " -f1

eDP1
HDMI1
```
or

```bash
xrandr --query | grep " connected"

eDP1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 340mm x 190mm panning 1920x1080+0+0
HDMI1 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 1600mm x 900mm
```
In my case eDP1 which is monitor laptop and HDMI1 which is the hdmi port, inside to bspwmrc. The followings lines:

```bash
bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 0
```
This configuration is to have 10 workspaces in your laptop screen.

or
```bash
bspc monitor eDP1 -d 1 2 3 4 5 
bspc monitor HDMI1 -d 6 7 8 9 0
```
Personally I use the second configuration to work with the second screen (HDM1) with 5 workspaces each monitor.

## Use sxhkd

To be able to use sxhkd keyboard shortcuts, need add this line into bspwmrc:
```bash
sxhkd &
```

# Basic system utilities

In this section we will cover some software that almost everybody needs on their
system. Keep in mind though that the changes we are going to make
will not be permanent. [This subsection](#xprofile) describes how to accomplish
that.

## Set keyboard layout

Before doing anything else, if you don't have a US keyboard, you should
change it using *setxkbmap*. To open xterm use **mod + return**. For example to
change your layout to english with dead keys:

```bash
setxkbmap -layout us -variant altgr-intl &
```
This configuration is personal, if you use another layout [check this link](https://gist.github.com/jatcwang/ae3b7019f219b8cdc6798329108c9aee) and add them inside bspwmrc.

If you want to add two keyboard layouts, add this into **bspwmrc**. Instead of the previous configuration:
the keybindings to change the layout will be the keys **alt + shift**:

```bash
setxkbmap -layout us,us -variant altgr-intl,dvorak-intl -option grp:alt_shift_toggle &
```

## Reset cursor

If you find yourself using a theme for the mouse cursor, bspwm fails to apply the theme you set. That way you have to reset the cursor theme settings.
Add this line inside bspwmrc:

```bash
xsetroot -cursor_name left_ptr &
```
## Wallpaper

First things first, your screen looks empty and black, so you might want to have
a wallpaper not to feel so depressed. You can open *firefox* through *rofi*
using **mod + m** and download one. Then install
**[feh](https://wiki.archlinux.org/index.php/Feh)** or
**[nitrogen](https://wiki.archlinux.org/index.php/Nitrogen)**
and and set your wallpaper:

```bash
sudo pacman -S feh
feh --bg-scale path/to/wallpaper
```
Once you set the wallpaper with the previous command, automatically created the file on your home direcction **~.fehgb**

add this line into bspwmrc.
```bash
sh ~/.fehbg &
```
## Fonts

Fonts in Arch Linux are basically a meme, before you run into any problems
you can just use the simple approach of installing these packages:

```bash
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts
```

To list all available fonts:

```bash
fc-list
```

## Audio

There is no audio at this point, we need
**[pulseaudio](https://wiki.archlinux.org/index.php/PulseAudio)**.
I suggest also installing a graphical program to control audio like
**[pavucontrol](https://www.archlinux.org/packages/extra/x86_64/pavucontrol/)**,
because we don't have keybindings for that yet:

```bash
sudo pacman -S pulseaudio pavucontrol
```

On Arch,
[pulseaudio is enabled by default](https://wiki.archlinux.org/index.php/PulseAudio#Running),
but you might need to reoot in order for it to actually start. After rebooting,
you can open *pavucontrol* through *rofi*, unmute the audio, and you should be
just fine.

Now you can set up keybindings for *pulseaudio*, open the file **sxhkdrc** in the sxhkd and add
these keys:

```c
XF86AudioRaiseVolume
	pamixer --increase 5
XF86AudioLowerVolume
	pamixer --decrease 5
```

For a better CLI experience though, I recommend using
**[pamixer](https://www.archlinux.org/packages/community/x86_64/pamixer/)**:

```bash
sudo pacman -S pamixer
```

Now you can turn your keybindings into:

```c
XF86AudioRaiseVolume
	pamixer --increase 5
XF86AudioLowerVolume
	pamixer --decrease 5
```

Restart BSPWM with **mod + control + r** and your keybindings should work. If
you're on a laptop, you might also want to control the brightness of your screen,
and for that I recommend

**[backlight](https://wiki.archlinux.org/title/backlight)**:

```bash
sudo pacman -S xorg-xbacklight
```

You can add these keybindings in sxhkdrc and restart BSPWM after:

```c
XF86MonBrightnessUp
	xbacklight -inc 10
XF86MonBrightnessDown
	xbacklight -dec 10
```

## Monitors

If you have a multi-monitor system, you surely want to use all your screens.
Here's how **[xrandr](https://wiki.archlinux.org/index.php/Xrandr)** CLI works:

```bash
# List all available outputs and resolutions
xrandr
# Common setup for a laptop and a monitor
xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
# In my case, I prefer use fake resolution "fake 1920x1080"
xrandr --output eDP1 --primary --scale 1.4055636869x1.40625 --panning 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off
```

We need to specify the position for each output, otherwise it will default to
0x0, and all your outputs will be overlapped. Now if you don't want to calculate pixels
and stuff you need a GUI like
**[arandr](https://www.archlinux.org/packages/community/any/arandr/)**:

```bash
sudo pacman -S arandr
```

Open it with *rofi*, arrange your screens however you want, and then you can
save that layout, which will basically give you a shell script with the exact
*xrandr* command that you need. Save that script, but don't click "apply" just
yet.

For a multi-monitor system, it's recommended to create an instance of a
*Screen* object for each monitor in your Qtile config.

You'll find an array called *screens* which contains only one object
initialized with a bar at the bottom. Inside that bar you can see the default
widgets that come with it.

Add as many screens as you have and copy-paste all widgets, later you can
customize them. Now you can go back to arandr, click *apply*, and then restart
Qtile.

Now your multi-monitor system should work.

## Fix Programs that use Java

Some programs that run in Java such as the JetBrains suite (IntelliJ, PyCharm, AndroidStudio) in the BSPWM environment do not work correctly (open the application but without image).
To solve this you need to install the following package: 
```bash
sudo pacman -S wmname
```
Add into bspwmrc:

```bash
wmname LG3D &
```
## Storage

Another basic utility you might need is automounting external hard drives or
USBs. For that I use **[udisks](https://wiki.archlinux.org/index.php/Udisks)**
and **[udiskie](https://www.archlinux.org/packages/community/any/udiskie/)**.
*udisks* is a dependency of *udiskie*, so we only need to install the last one.
Install also **[ntfs-3g](https://wiki.archlinux.org/index.php/NTFS-3G)**
package to read and write NTFS formatted drives:

```bash
sudo pacman -S udiskie ntfs-3g
```

## Network

We have configured the network through *nmcli*, but a graphical frontend is
more friendly. I use
**[nm-applet](https://wiki.archlinux.org/index.php/NetworkManager#nm-applet)**:

```bash
sudo pacman -S network-manager-applet
```
## Blueman

so you can connect peripherals via bluetooth install blueman, with the following command.

```bash
sudo pacman -S blueman
```
## Systray

By default, you have a system tray in BSPWM, but there's nothing running in it.
You can launch the programs we've just installed like so:
Add to bspwmrc

```bash
udiskie -t &
nm-applet &
blueman-applet &
```

Now you should see icons that you can click to configure drives and networking.
Optionally, you can install tray icons for volume and battery:

```bash
sudo pacman -S volumeicon cbatticon
```
Add to bspwmrc
```bash
volumeicon &
cbatticon &
```

## Notifications

I like having desktop notifications as well, for that you need to install
[**libnotify**](https://wiki.archlinux.org/index.php/Desktop_notifications#Libnotify)
and [**notification-daemon**](https://www.archlinux.org/packages/community/x86_64/notification-daemon/):

```bash
sudo pacman -S libnotify notification-daemon
```

For a tiling window manager,
[this is how you can get notifications](https://wiki.archlinux.org/index.php/Desktop_notifications#Standalone):

```bash
# Create this file with nano or vim
sudo nano /usr/share/dbus-1/services/org.freedesktop.Notifications.service
# Paste these lines
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon
```

Test it like so:

```bash
notification-send "Hello World"
```

## Xprofile and Execute BSPWM

As I have mentioned before, all these changes are not permanent. In order to
make them permanent, we need a couple things. First, install
**[xinit](https://wiki.archlinux.org/index.php/Xinit)**:


```bash
sudo pacman -S xorg-xinit
```

Now you can use *~/.xprofile* to run programs before your window manager starts:

```bash
touch ~/.xprofile
```

For example, if you place this in *~.xprofile*:
To use bspwm correctly, you must execute the following line in the .xprofile file.

```bash
bash  

```

```bash
xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 1366x0 --rotate normal --output VIRTUAL1 --off

#BSPWM
if echo $XDG_SESSION_DESKTOP=bspwm
    exec bspwm
fi

```

Every time you login you will have all systray utilities and monitors set.

In my case add these lines with conditionals since I have another WM, which is [Qtile](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/qtile).
The same if you have other DE or WM installed, add so that you can run bspwm correctly. 

# Set Polybar

[Check this](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/polybar)

# Further configuration and tools

## AUR helper

Now that you have some software that allows you tu use your computer without
losing your patience, it's time to do more interesting stuff. First, install an
**[AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers)**, I use
**[yay](https://github.com/Jguer/yay)**:

```bash
sudo pacman -S base-devel git
cd /opt/
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R username:username yay-git/
cd yay-git
makepkg -si
```

With an *Arch User Repository helper*, you can basically install
any piece of software on this planet that was meant to run on Linux.

## Media Transfer Protocol

If you want to connect your phone to your computer using a USB port, you'll
need MTP implementation and some CLI to use it, like
[this one](https://aur.archlinux.org/packages/simple-mtpfs/):

```bash
sudo pacman -S libmtp
yay -S simple-mtpfs

# List connected devices
simple-mtpfs -l
# Mount first device in the previous list
simple-mtpfs --device 1 /mount/point
```

## File Manager

We've done all files stuff through a terminal up to this point, but you can
install graphical or terminal based file managers.
For a graphical one, I suggest
**[thunar](https://wiki.archlinux.org/index.php/Thunar)**
and for a terminal based one,
**[ranger](https://wiki.archlinux.org/index.php/Ranger)**, although this one
is very vim-like, only use it if you know how to move in vim.

```bash
sudo pacman -S thunar ranger
```

## Trash

If you don't want to *rm* all the time and potentially lose files, you need a
trashing system. Luckily, that's pretty easy to do, using
[some of these tools](https://wiki.archlinux.org/index.php/Trash_management#Trash_creation)
such as **[glib2](https://www.archlinux.org/packages/core/x86_64/glib2/)**,
and for GUIs like *thunar* you need **[gvfs](https://www.archlinux.org/packages/extra/x86_64/gvfs/)**:

```bash
sudo pacman -S glib2 gvfs
# CLI usage
gio trash path/to/file
# Empty trash
gio trash --empty
```

With *thunar* you can open the trash clicking on the left panel, but on the command
line you can use:

```bash
ls ~/.local/share/Trash/files
```

## GTK Theming

The moment you have been wating for has arrived, you are finally going to
install a dark theme. I use *Material Black Colors*, so go grab a flavor
[here](https://www.gnome-look.org/p/1316887/) and the matching icons
[here](https://www.pling.com/p/1333360/).

I suggest starting with
*Material-Black-Blueberry* and *Material-Black-Blueberry-Suru*. You can find
other GTK themes [on this page](https://www.gnome-look.org/browse/cat/135/).
Once you have your theme folders downloaded, this is what you do:

```bash
# Assuming you have downloaded Material-Black-Blueberry
cd Downloads/
sudo pacman -S unzip
unzip Material-Black-Blueberry.zip
unzip Material-Black-Blueberry-Suru.zip
rm Material-Black*.zip

# Make your themes available
sudo mv Material-Black-Blueberry /usr/share/themes
sudo mv Material-Black-Blueberry-Suru /usr/share/icons
```

Now edit **~/.gtkrc-2.0** and **~/.config/gtk-3.0/settings.ini** by adding
these lines:

```ini
# ~/.gtkrc-2.0
gtk-theme-name = "Material-Black-Blueberry"
gtk-icon-theme-name = "Material-Black-Blueberry-Suru"

# ~/.config/gtk-3.0/settings.ini
gtk-theme-name = Material-Black-Blueberry
gtk-icon-theme-name = Material-Black-Blueberry-Suru
```

Next time you log in, these changes will be visible. You can also install a
different cursor theme, for that you need
**[xcb-util-cursor](https://www.archlinux.org/packages/extra/x86_64/xcb-util-cursor/)**.
The theme I use is
[Breeze](https://www.gnome-look.org/p/999927/), download it and then:

```bash
sudo pacman -S xcb-util-cursor
cd Downloads/
tar -xf Breeze.tar.gz
sudo mv Breeze /usr/share/icons
```

Edit **/usr/share/icons/default/index.theme** by adding this:

```ini
[Icon Theme]
Inherits = Breeze
```

Now, again, edit **~/.gtkrc-2.0** and **~/.config/gtk-3.0/settings.ini**:

```ini
# ~/.gtkrc-2.0
gtk-cursor-theme-name = "Breeze"

# ~/.config/gtk-3.0/settings.ini
gtk-cursor-theme-name = Breeze
```

Make sure not to mistype the names of your themes and icons, they should
match the names of the directories where they are located, the ones you can
see in this output:

```bash
ls /usr/share/themes
ls /usr/share/icons
```

Remember that you will only see the new theme if you log in again.
There are also graphical frontends for changing themes, I just prefer the
traditional way of editing files though, but you can use
**[lxappearance](https://www.archlinux.org/packages/community/x86_64/lxappearance/)**,
which is a desktop environment independent GUI for this task, and it lets you
preview themes.

```bash
sudo pacman -S lxappearance
```

Finally, if you want tranparency and fancy looking things, install a compositor:

```bash
sudo pacman -S picom
# Run it like so, place it in ~/.xrofile
picom &
```

## Qt

GTK themes will not be applied to Qt programs, but you can use
[**Kvantum**](https://archlinux.org/packages/?name=kvantum-qt5) to change the
default theme:

```bash
sudo pacman -S kvantum-qt5
echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile
```

## Lightdm theming

We can also change the theme of *lightdm* and make it look cooler, because why
not? We need another greeter, and some theme, namely
**[lightdm-webkit2-greeter](https://www.archlinux.org/packages/community/x86_64/lightdm-webkit2-greeter/)**
and  **[lightdm-webkit-theme-aether](https://aur.archlinux.org/packages/lightdm-webkit-theme-aether/)**:

```bash
sudo pacman -S lightdm-webkit2-greeter
yay -S lightdm-webkit-theme-aether
```

These are the configs you need to make:

```ini
# /etc/lightdm/lightdm.conf
[Seat:*]
# ...
# Uncomment this line and set this value
greeter-session = lightdm-webkit2-greeter
# ...

# /etc/lightdm/lightdm-webkit2-greeter.conf
[greeter]
# ...
webkit_theme = lightdm-webkit-theme-aether
```

Ready to go.

## Multimedia

There are dozens of programs for multimedia stuff, check
[this page](https://wiki.archlinux.org/index.php/List_of_applications/Multimedia).

### Images

For image previews, one of the best that I could find is
[geeqie](https://www.archlinux.org/packages/extra/x86_64/geeqie/):

```bash
sudo pacman -S geeqie
```

### Video and audio

No doubt
[vlc](https://wiki.archlinux.org/index.php/VLC_media_player_(Espa%C3%B1ol))
is exactly what you need:

```bash
sudo pacman -S vlc
```

# Keybindings

These are common keybindings to all my window managers.

## Windows

| Key                     | Action                           |
| ----------------------- | -------------------------------- |
| **mod + h**             | next window (left)               |
| **mod + j**             | next window (down)               |
| **mod + k**             | next window (up)                 |
| **mod + l**             | next window (right)              |
| **mod + tab**           | change monitor focus (workspace) |
| **mod + [1-9]**         | Switch to workspace N (1-9)      |
| **mod + shift + [1-9]** | Send Window to workspace N (1-9) |
| **mod + w**             | kill window                      |
| **mod + ctrl + r**      | restart wm                       |
| **mod + ctrl + q**      | quit                             |
| **mod + x**             | lockscreen (betterlockscreen)    |
| **mod + shift + x**     | lockscreen + suspend (betterlockscreen)    |

The following keybindings will only work if you install all programs needed:

```bash
sudo pacman -S rofi thunar firefox alacritty redshift scrot
```

To set up *rofi*,
[check this README](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/rofi),
and for *alacritty*, [this one](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/alacritty).


