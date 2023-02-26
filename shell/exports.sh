# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
#export JAVA_HOME='/Library/Java/JavaVirtualMachines/amazon-corretto-15.jdk/Contents/Home'
export JAVA_HOME='/usr/lib/jvm/default'
export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/.go"
export CHROME_EXECUTABLE="/bin/google-chrome-stable" # Flutter Web

# ------------------------------------------------------------------------------
# Apps
# ------------------------------------------------------------------------------
#if [ "$CODELY_THEME_MODE" = "dark" ]; then
  #fzf_colors="pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934"
#else
  #fzf_colors="pointer:#db0f35,bg+:#d6d6d6,fg:#808080,fg+:#363636,hl:#8ec07c,info:#928374,header:#fffee3"
#fi
fzf_colors="pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934"

export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
export path=(
  "$HOME/bin"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$JAVA_HOME/bin"
  "$GEM_HOME/bin"
  "$GOPATH/bin"
  "$HOME/.cargo/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/opt/homebrew/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
  "$HOME/.npm-global/bin"
  "$HOME/.local/bin" # python pip packages
  "/opt/flutter/bin" # flutter
)

#Calcurse editor and visual NVIM
export CALCURSE_EDITOR="nvim"
export VISUAL="nvim"
export EDITOR="nvim"

#Qt5 Apps Enviroment
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE="kvantum"

export SUDO_PROMPT="passwd: "
