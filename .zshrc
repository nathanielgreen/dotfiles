# Setup zoxide
eval "$(zoxide init zsh)"

# Setup ASDF Version manager
. $HOME/.asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

# Set up zsh autocomplete
source /home/ngreen/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# ZSH History config
setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY # record command start time


# -----
# Exports
# =====
export VISUAL=nvim
export EDITOR="$VISUAL"
export HISTFILE="/home/ngreen/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
export BROWSER=/usr/bin/firefox
export CHROME_EXECUTABLE="/usr/lib64/chromium-browser/chromium-browser"
export STARSHIP_CONFIG="/home/ngreen/.config/starship.toml"



# -----
# Path
# =====
# Android Tools Path
export PATH="$PATH":"/home/ngreen/Android/Sdk/emulator"
export PATH="$PATH":"/home/ngreen/Android/Sdk/tools"
export PATH="$PATH":"/home/ngreen/Android/Sdk/platform-tools"
# Setup Flutter
export PATH="$PATH":"/usr/local/bin/flutter/bin"
# Flutter global Executables
export PATH="$PATH":"/usr/local/bin/flutter/.pub-cache/bin"
# Dart global Executables
export PATH="$PATH":"$HOME/.pub-cache/bin"



# -----
# Aliases
# =====
alias vim="nvim"
alias weather="curl wttr.in | less"
alias nnn="nnn"
alias icat="kitty +kitten icat"
alias cputemp="watch -n 2 sensors"
alias gputemp="watch -n 2 nvidia-smi"
alias blayout='i3-msg "workspace 4; append_layout /home/ngreen/.config/i3/runners.json"'
alias btest='i3-msg "workspace 4; append_layout /home/ngreen/.config/i3/test.json"'
alias bapi="mvn appengine:run -pl evogro-server-api"
alias badmin="mvn appengine:run -pl evogro-server-admin"
alias bmobile="mvn appengine:run -pl evogro-server-mobile"
alias blogin="mvn appengine:run -pl evogro-server-login"
alias bseed='mvn -pl evogro-server-api -Dtest="com.evogro.farmino.acceptancetest.FarminoAcceptanceTest#createDataForNat" test'

eval "$(starship init zsh)"
