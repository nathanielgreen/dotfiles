# Setup zoxide
eval "$(zoxide init zsh)"

# Setup ASDF Version manager
. $HOME/.asdf/asdf.sh


# -----
# Exports
# =====
export VISUAL=nvim
export EDITOR="$VISUAL"
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

# Init Starship
eval "$(starship init zsh)"
