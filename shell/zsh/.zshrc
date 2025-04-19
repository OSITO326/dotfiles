# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Uncomment for debuf with `zprof`
# zmodload zsh/zprof

# Flex on the ubuntu users
#neofetch

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
setopt +o nomatch
setopt autopushd

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Start zim
source "$ZIM_HOME/init.zsh"

# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

source "$DOTFILES_PATH/shell/init.sh"

source $ZSH_REVERSE/reverse_search.zsh
source "$DOTFILES_PATH/shell/zsh/key-bindings.zsh"

# fnm
export PATH="/home/osito/.local/share/fnm:$PATH"
eval "`fnm env`"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
  SPACESHIP_PROMPT_ASYNC=false
  SPACHESHIP_PROMPT_SEPARATE_LINE=false
  SPACESHIP_CHAR_SYMBOL=""
fi

# pnpm
export PNPM_HOME="/home/osito/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# Load Angular CLI autocompletion.
source <(ng completion script)

# Zoxide
eval "$(zoxide init zsh)"
