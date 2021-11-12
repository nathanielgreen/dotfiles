# Path to your oh-my-zsh installation.
export ZSH="/home/ngreen/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Setup zoxide
eval "$(zoxide init zsh)"

# Plugins
plugins=(git)

# Setup ASDF Version manager
. $HOME/.asdf/asdf.sh

# -----
# Exports
# =====

# Editor
export VISUAL=nvim
export EDITOR="$VISUAL"

export BROWSER=/usr/bin/firefox

# Android Tools Path
export PATH="$PATH":"/home/ngreen/Android/Sdk/emulator"
export PATH="$PATH":"/home/ngreen/Android/Sdk/tools"
export PATH="$PATH":"/home/ngreen/Android/Sdk/platform-tools"

# -----
# Aliases
# =====
alias vim="nvim"
alias weather="curl wttr.in | less"
alias nnn="nnn"
alias icat="kitty +kitten icat"
alias cputemp="watch -n 2 sensors"
alias gputemp="watch -n 2 nvidia-smi"

source $ZSH/oh-my-zsh.sh
