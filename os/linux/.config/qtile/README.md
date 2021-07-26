# Basic qtile configuration

all configuration in Qtile, all credits to Antonio Sarosi.
* Original repo [here](https://github.com/antoniosarosi/dotfiles/).

Now that you're in Qtile, you should know some of the default keybindings.

| Key                  | Action                     |
| -------------------- | -------------------------- |
| **mod + return**     | launch xterm                   |
| **mod + k**          | next window                    |
| **mod + j**          | previous window                |
| **mod + w**          | kill window                    |
| **mod + [asdfuiop]** | go to workspace [asdfuiop]     |
| **mod + ctrl + r**   | restart qtile                  |
| **mod + ctrl + q**   | logout                         |

Before doing anything else, if you don't have a US keyboard, you should
change it using *setxkbmap*. To open xterm use **mod + return**. For example to
change your layout to english with dead keys:

```bash
setxkbmap -layout us -variant altgr-intl &
```

Note that this change is not permanent, if you reboot you have to type that
command again. See [this section](#xprofile) for making it permanent, or
follow the natural order of this guide if you have enough time.

There is no menu by default, you have to launch programs through xterm. At this
point, you can pick your terminal emulator of choice and install a program
launcher.

```bash
# Install another terminal emulator if you want
sudo pacman -S alacritty
```

Now open the config file:

```bash
code ~/.config/qtile/config.py
```

At the beginning, after imports, you should find an array called *keys*,
and it contains the following line:

```python
Key([mod], "Return", lazy.spawn("xterm")),
```

Change that line to launch your terminal emulator:

```python
Key([mod], "Return", lazy.spawn("alacritty")),
```

Install a program launcher like
**[dmenu](https://wiki.archlinux.org/index.php/Dmenu)**
or **[rofi](https://wiki.archlinux.org/index.php/Rofi)**:

```bash
sudo pacman -S rofi
```

Then add keybindings for that program:

```python
Key([mod], "m", lazy.spawn("rofi -show run")),
Key([mod, 'shift'], "m", lazy.spawn("rofi -show")),
```

Now restart Qtile with **mod + control + r**. You should be able to open your
menu and terminal emulator with keybindings. If you picked rofi, you can
change its theme like so:

```bash
sudo pacman -S which
rofi-theme-selector
```

That's it for Qtile, now you can start hacking on it and make it your own.
Checkout my custom Qtile config
[here](https://github.com/antoniosarosi/dotfiles/tree/master/.config/qtile).
But before that I would recommend configuring basic utilities like audio,
battery, mounting drives, etc.

# Basic system utilities

In this section we will cover some software that almost everybody needs on their
system. Keep in mind though that the changes we are going to make
will not be permanent. [This subsection](#xprofile) describes how to accomplish
that.

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

Now you can set up keybindings for *pulseaudio*, open Qtile's config.py and add
these keys:

```python
# Volume
Key([], "XF86AudioLowerVolume", lazy.spawn(
    "pactl set-sink-volume @DEFAULT_SINK@ -5%"
)),
Key([], "XF86AudioRaiseVolume", lazy.spawn(
    "pactl set-sink-volume @DEFAULT_SINK@ +5%"
)),
Key([], "XF86AudioMute", lazy.spawn(
    "pactl set-sink-mute @DEFAULT_SINK@ toggle"
)),
```

For a better CLI experience though, I recommend using
**[pamixer](https://www.archlinux.org/packages/community/x86_64/pamixer/)**:

```bash
sudo pacman -S pamixer
```

Now you can turn your keybindings into:

```python
# Volume
Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),
Key([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
```

Restart Qtile with **mod + control + r** and your keybindings should work. If
you're on a laptop, you might also want to control the brightness of your screen,
and for that I recommend
**[brightnessctl](https://www.archlinux.org/packages/community/x86_64/brightnessctl/)**:

```bash
sudo pacman -S brightnessctl
```

You can add these keybindings and restart Qtile after:

```python
# Brightness
Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
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

By default, you have a system tray in Qtile, but there's nothing running in it.
You can launch the programs we've just installed like so:

```bash
udiskie -t &
nm-applet &
blueman-applet &
```

Now you should see icons that you can click to configure drives and networking.
Optionally, you can install tray icons for volume and battery:

```bash
sudo pacman -S volumeicon cbatticon
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

## Xprofile

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

```bash
xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
setxkbmap -layout us -variant altgr-intl &
udiskie -t &
nm-applet &
blueman-applet &
```

Every time you login you will have all systray utilities, your keyboard layout
and monitors set.

# Keybindings

These are common keybindings to all my window managers.

## Windows

| Key                     | Action                           |
| ----------------------- | -------------------------------- |
| **mod + j**             | next window (down)               |
| **mod + k**             | next window (up)                 |
| **mod + shift + h**     | decrease master                  |
| **mod + shift + l**     | increase master                  |
| **mod + shift + j**     | move window down                 |
| **mod + shift + k**     | move window up                   |
| **mod + shift + f**     | toggle floating                  |
| **mod + tab**           | change layout                    |
| **mod + [1-9]**         | Switch to workspace N (1-9)      |
| **mod + shift + [1-9]** | Send Window to workspace N (1-9) |
| **mod + period**        | Focus next monitor               |
| **mod + comma**         | Focus previous monitor           |
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


## Apps

| Key                     | Action                        |
| ----------------------- | ----------------------------- |
| **mod + space**         | launch rofi                   |
| **mod + shift + space** | window nav (rofi)             |
| **mod + shift + e**     | window emoji (rofi)           |
| **mod + b**             | launch browser (firefox)      |
| **mod + e**             | launch file explorer (thunar) |
| **mod + return**        | launch terminal (alacritty)   |
| **mod + r**             | redshift                      |
| **mod + shift + r**     | stop redshift                 |
| **mod + s**             | screenshot (scrot)            |
| **Print**               | maim (fullscreen)             |
| **shift + Print**       | maim (area)                   |
| **mod + c**             | vscode                        |
| **mod + i**             | intellij-idea                 |
| **mod + t**             | telegram                      |
| **mod + p**             | gpick (colorpicker)           |

## Rofi

The configuration of rofi, [click here](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/rofi)

## Packages Requierements
|                       Packages                          |             Yay packages             |
|---------------------------------------------------------|--------------------------------------|
|   cmatrix                                               |   aic94xx-firmware                   |
|   composer                                              |   alsi                               |
|   feh                                                   |   android-studio                     |
|   geeqie                                                |   betterlockscreen                   |
|   htop                                                  |   checkra1n-cli                      |
|   hunspell                                              |   i3lock-color                       |
|   hunspell-es_any                                       |   intellij-idea-ultimate-edition     |
|   hunspell-es_es                                        |   intellij-idea-ultimate-edition-jre |
|   hyphen-es                                             |   lightdm-webkit-theme-aether        |
|   jdk-openjdk                                           |   necta-wifi-mouse                   |
|   kvantum-qt5                                           |   nerd-fonts-ubuntu-mono             |
|   **LEMP(nginx,php, mysql)**                            |   pfetch                             |
|   libreoffice-fresh                                     |   picom-git                          |
|   libreoffice-fresh-es                                  |   pipes.sh                           |
|   lightdm-webkit2-greeter                               |   postman-bin                        |
|   lsd                                                   |   qmk-git                            |
|   lxappearance                                          |   qt5-styleplugins                   |
|   maim                                                  |   rofi-power-menu                    |
|   neofetch                                              |   scrcpy                             |
|   neovim                                                |   simplenote-electron-bin            |
|   nodejs                                                |   skypeforlinux-stable-bin           |
|   notification-daemon                                   |   spotify                            |
|   npm                                                   |   telegram-desktop-bin               |
|   qbittorrent                                           |   ttf-ms-fonts                       |
|   ranger                                                |   tty-clock                          |
|   redshift                                              |   upd72020x-fw                       |
|   rofi                                                  |   visual-studio-code-bin             |
|   rofi-emoji                                            |   wd719x-firmware                    |
|   rofi-power-menu                                       |   yay-bin                            |
|   sl                                                    |   zoom                               |
|   thunar(thunar-archive-plugin,thunar-media-tags-plugin)|   zramswap                           |
|   tree                                                  |                                      |
|   ueberzug                                              |                                      |
|   vlc                                                   |                                      |
|   xarchiver                                             |                                      |
|   xcb-util-cursor                                       |                                      |
|   youtube-dl                                            |                                      |
|   zathura(zathura-cb,zathura-djvu,zathura-pdf-mudpf)    |                                      |