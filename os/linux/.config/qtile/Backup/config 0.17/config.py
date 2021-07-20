from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess

##AUTOSTART
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

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
    ([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "space", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "space", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("firefox")),

    # File Explorer
    #([mod], "e", lazy.spawn("pcmanfm")),
    ([mod], "e", lazy.spawn("dolphin")),

    # Terminal
    ([mod], "Return", lazy.spawn("alacritty")),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 5400")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    #([mod], "s", lazy.spawn("scrot")),
    ([mod], "s", lazy.spawn("scrot -e 'mv $f ~/Pictures/ScreenshotsScrot/%B%d-%H:%M:%S.png'")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]

groups = [Group(i) for i in [
    #"   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ",
    "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ",
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])


layouts = [
    #layout.Columns(border_focus_stack="#66818d"),
    layout.Max(),
    layout.MonadTall(border_focus="#66818d",border_width=1,margin=4),
    layout.MonadWide(border_focus="#66818d",border_width=1,margin=4),
    layout.Bsp(border_focus="#66818d",border_width=1,margin=4),
    layout.Matrix(columns=2,border_focus="#66818d",border_width=1,margin=4),
    layout.RatioTile(border_focus="#66818d",border_width=1,margin=4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]



widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()

## SCREENS

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(foreground="#f1ffff",font='UbuntuMono Nerd Font', fontsize=19, margin_y=3, margin_x=0, padding_y=8, padding_x=5, borderwidth=1, active="#f1ffff", inactive="#4c566a", rounded=False, highlight_method='block',   urgent_alert_method='block', urgent_border="#3f575b", this_current_screen_border="#66818d", this_screen_border="#37383b", other_current_screen_border="#0f101a", other_screen_border="#0f101a", disable_drag=True),
                widget.WindowName(foreground="#66818d", fontsize=14, padding=5),
                #widget.HDDGraph(border_color="#f1ffff", frequency=1,graph_color='#18baeb', margin_x=3, margin_y=3, start_pos='bottom'),
                widget.Spacer(length=1,width=1),
                widget.CheckUpdates(distro='Arch',background="#66818d", update_interval=1800, padding=5),
                widget.Spacer(length=1,width=1),
                widget.TextBox(text="龍 enp8s0:", background="#556a74", fontsize=14, padding=5),
                widget.Net(interface="enp8s0", format = '{down} ↓↑ {up}', background="#556a74", paddin=5),
                widget.Spacer(length=1,width=1),
                widget.CurrentLayoutIcon(background="#3f575b", scale=0.65),
                widget.CurrentLayout(background="#3f575b", padding=5),
                widget.Spacer(length=1,width=1),
                widget.TextBox(text="🌡", background="#3f575b", fontsize=14, padding=5),
                widget.ThermalSensor(background="#3f575b", update_interval=2, padding=5),
                widget.Clock(background="#0f101a", format='%A %d %B %Y | %I:%M:%S %p '),
                widget.Systray(background="#0f101a", padding=5),
                #widget.Prompt(),
                #widget.Chord(
                #    chords_colors={
                #        'launch': ("#ff0000", "#ffffff"),
                #    },
                #    name_transform=lambda name: name.upper(),
                #),
                #widget.TextBox("default config", name="default"),
                #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                #widget.Clock(format='%A %d %B %Y | %I:%M:%S %p '),
                #widget.QuickExit(),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(foreground="#f1ffff",font='UbuntuMono Nerd Font', fontsize=19, margin_y=3, margin_x=0, padding_y=8, padding_x=5, borderwidth=1, active="#f1ffff", inactive="#4c566a", rounded=False, highlight_method='block',   urgent_alert_method='block', urgent_border="#3f575b", this_current_screen_border="#66818d", this_screen_border="#37383b", other_current_screen_border="#0f101a", other_screen_border="#0f101a", disable_drag=True),
                widget.Sep(linewidth=0, padding=5),
                widget.CurrentLayoutIcon(background="#3f575b", scale=0.65),
                widget.CurrentLayout(background="#3f575b", padding=5),
            ],
            24,
        ),
    ),
]
                    
# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = 'urgent'
wmname = 'LG3D'


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
