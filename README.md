<h1 align="center">
  .dotfiles created using <a href="https://github.com/CodelyTV/dotly">🌚 dotly</a>
</h1>

![logo](https://github.com/OSITO326/dotfiles/blob/main/assets/dotfiles.png)

## Restore your Dotfiles manually

* Install git
* Clone your dotfiles repository `git clone [your repository of dotfiles] $HOME/.dotfiles`
* Go to your dotfiles folder `cd $HOME/.dotfiles`
* Install git submodules `git submodule update --init --recursive modules/dotly`
* Install your dotfiles:
    - `DOTFILES_PATH="$HOME/.dotfiles" DOTLY_PATH="$DOTFILES_PATH/modules/dotly"` 
    - `"$DOTLY_PATH/bin/dot" self install`
* Restart your terminal
* Import your packages `dot package import`

> ```shell
> export DOTFILES_PATH="$HOME/.dotfiles" 
> export DOTLY_PATH="$DOTFILES_PATH/modules/dotly"
> "$DOTLY_PATH/bin/dot" self install or dot self install
> ```

## Qtile Tiling Window Manager

[Check this README](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/qtile)

## BSPWM with Polybar
- [BSPWM](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/bspwm)
- [Polybar](https://github.com/OSITO326/dotfiles/tree/main/os/linux/.config/polybar)

## Some screenshots:
- BSPWM with Polybar

![preview1](/assets/bspwm_polybar.png)