# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="nanotech"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# History
#HISTSIZE=100000
#SAVEHIST=100000
#HISTFILE=$HOME/.zhistory

#plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
plugins=(git sudo)
# sudo pacman -S zsh-syntax-autosuggestions
autosuggestions=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# sudo pacman -S zsh-syntax-highlighting
syntax=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source plugins
if [[ -f $sudo ]]; then
    source $sudo
    bindkey -M vicmd '^[s' sudo-command-line # ALT + s
    bindkey -M viins '^[s' sudo-command-line # ALT + s
fi
[[ -f $autosuggestions ]] && source $autosuggestions
[[ -f $syntax ]] && source $syntax

# oh-my-zsh
source $ZSH/oh-my-zsh.sh


# autocomplete
#setopt autocd
#zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list '' \
  #'m:{a-z\-}={A-Z\_}' \
  #'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  #'r:|?=** m:{a-z\-}={A-Z\_}'
#zmodload zsh/complist
#autoload -Uz compinit
#compinit

# User configuration
# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
setopt +o nomatch

autoload -Uz promptinit && promptinit

# init.sh
source $DOTFILES_PATH/shell/init.sh

# reverser search
source $ZSH_REVERSE/reverse_search.zsh
