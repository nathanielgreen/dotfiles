# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup zoxide
eval "$(zoxide init zsh)"

# Setup ASDF Version manager
. $HOME/.asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

# Set up zsh autocomplete
source /home/ngreen/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh



# -----
# Exports
# =====
export VISUAL=nvim
export EDITOR="$VISUAL"
export HISTFILE="/home/ngreen/.zsh_history"
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

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
