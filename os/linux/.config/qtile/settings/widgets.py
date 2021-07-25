from libqtile import widget
from settings.theme import colors
from libqtile import qtile #widget CheckUpdate (mouse callbacks)
# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

MyTerm="alacritty"

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-2
    )


def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=16,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=0,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='windowname'), fontsize=16, padding=5),
        separator(),
    ]

primary_widgets = [
    *workspaces(),

    separator(),

    powerline('color6', 'dark'),

    icon(bg="color6", text=' '), # Icon: nf-fa-download
    
    widget.CheckUpdates(
        **base(bg='color6'), 
        colour_have_updates=colors['text'], 
        colour_no_updates=colors['text'],
        display_format='{updates}', 
        update_interval=1800,
        #mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(MyTerm + ' -e sudo pacman -Syu'),
    ),

    powerline('color5', 'color6'),

    icon(bg="color5", text='龍 '),  # Icon: nf-fa-feed
    
    #widget.Net(**base(bg='color3'), interface='wlp2s0'),
    widget.Net(**base(bg='color5'), font='UbuntuMono Nerd Font', interface="enp8s0"),
    
    powerline('color4', 'color5'),
    
    icon(bg="color4", text="🖬"),

    widget.Memory(background=colors['color4'], font='UbuntuMono Nerd Font Mono', measure_mem='M'),

    powerline('color3', 'color4'),
    
    icon(bg='color3', text="🌡"),
    
    widget.ThermalSensor(**base(bg='color3'), padding=2, font='UbuntuMono Nerd Font Mono'),

    icon(bg='color3', text='  '),

    widget.CPU(**base(bg='color3'), padding=2, font='UbuntuMono Nerd Font Mono'),

    powerline('color2','color3'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5, font='UbuntuMono Nerd Font Mono'),

    powerline('color1','color2'),

    #icon(bg="color1", fontsize=18, text=' '), # Icon: nf-mdi-calendar_clock

    icon(bg="color1", text='  '), # Icon: nf-mdi-calendar_clock

    #widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    #widget.Clock(**base(bg='color1'), fontsize=16,format='%A %d %B %Y |   %I:%M:%S %p '),

    widget.Clock(**base(bg='color1'), fontsize=16, format='%A %d %B %Y |   %I:%M %p '),

    widget.Systray(background=colors['color1'], padding=5),

]

secondary_widgets = [
    *workspaces(),

    separator(),

    #powerline('color1', 'dark'),

    #widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

    #widget.CurrentLayout(**base(bg='color1'), padding=5),

    powerline('color2', 'dark'),#fin widget NET, powerline con widget net
    
    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),
    
    powerline('color1', 'color2'),
    
    icon(bg="color1", text='  '), # Icon: nf-mdi-calendar_clock

    #widget.Clock(**base(bg='color1'), fontsize=16, format='%A %d %B %Y |   %I:%M:%S %p '),
    widget.Clock(**base(bg='color1'), fontsize=16, format='%A %d %B %Y |   %I:%M %p '),

]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
