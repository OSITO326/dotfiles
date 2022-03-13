# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"
alias la="ls -la"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# Git
alias gaa="git add -A"
alias gcm="git commit -m"
alias gst="git status"
alias gpl="git pull"
alias gc="git clone"
alias gb="git branch"
alias gco="git checkout"

#alias gaa="git add -A"
#alias gc='$DOTLY_PATH/bin/dot git commit'
#alias gca="git add --all && git commit --amend --no-edit"
#alias gco="git checkout"
#alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
#alias gs="git status -sb"
#alias gf="git fetch --all -p"
#alias gps="git push"
#alias gpsf="git push --force"
#alias gpl="git pull --rebase --autostash"
#alias gb="git branch"
#alias gl='$DOTLY_PATH/bin/dot git pretty-log'

#NeoVim
alias v.='nvim .'
alias v='nvim'

#LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
#alias lt='ls --tree'

#Zathura
alias z='zathura'

#Nginx
alias html='cd /usr/share/nginx/html/'

#Bat
#alias cat='bat'
alias cat='bat --style=plain --paging=never'

#Arch/Manjaro
#alias update='sudo pacman -Sy'
#alias upgrade='sudo pacman -Syu'

# Utils
alias k='kill -9'
#alias i.='(idea $PWD &>/dev/null &)'
alias i.='(intellij-idea-ultimate-edition $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='thunar'
#alias o.='open .'
