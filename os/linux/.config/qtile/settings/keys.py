# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    #([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "space", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "space", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("firefox")),

    # File Explorer
    ([mod], "e", lazy.spawn("pcmanfm")),
    #([mod], "e", lazy.spawn("thunar")), #Thunar bug, close app crashed v 4.16

    # Terminal
    ([mod], "Return", lazy.spawn("alacritty")),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 5400")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    #([mod], "s", lazy.spawn("scrot")),
    #([mod], "s", lazy.spawn("scrot -e 'mv $f ~/Pictures/ScreenshotsScrot/%d%B%Y-%H:%M:%S.png'")),
    #([], "Print", lazy.spawn("scrot -e 'mv $f ~/Pictures/ScreenshotsScrot/Screenshot_%d%m%Y_%H:%M:%S%p-$wx$h.png'")), 
    ([], "Print", lazy.spawn("scrot -e 'mv $f ~/Pictures/ScreenshotsScrot/Screenshot_%F_%T.png'")), 

    #VisualCode
    ([mod], "c", lazy.spawn("code")),

    #IdeaCommunity
    ([mod], "i", lazy.spawn("idea-ce")),

    #Telegram-Desktop
    ([mod], "t", lazy.spawn("telegram-desktop")),

    #Gpick ColorPicker
    ([mod], "p", lazy.spawn("gpick")),

    # ------------ Hardware Configs ------------

    # Volume
    #([], "XF86AudioLowerVolume", lazy.spawn(
       # "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    #)),
    #([], "XF86AudioRaiseVolume", lazy.spawn(
      #  "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    #)),
    #([], "XF86AudioMute", lazy.spawn(
     #   "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    #)),
    #Volume with pamixer install 
    ([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    ([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),
    ([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    #Volumen shortcut with keyboard
    ([mod, "shift"],"apostrophe", lazy.spawn("pamixer --decrese 5")),
    ([mod, "shift"],"semicolon", lazy.spawn("pamixer --increase 5")),
    #Multimedia Keys with playerctl
    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
   #Shortcuts Multimedia Keys only keyboard
    ([mod, "shift"],"comma", lazy.spawn("playerctl previous")),
    ([mod, "shift"],"period", lazy.spawn("playerctl next")),
    ([mod, "shift"],"slash", lazy.spawn("playerctl play-pause")),
    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    # Shortcuts Brightness with keyboard
    ([mod, "shift"],"equal", lazy.spawn("brightnessctl set +10%")),
    ([mod, "shift"],"minus", lazy.spawn("brightnessctl set 10%-")),
]]
