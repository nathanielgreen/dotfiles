if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setup zoxide
zoxide init fish | source

# Setup ASDF Version manager
source /opt/homebrew/opt/asdf/libexec/asdf.fish


# -----
# Exports
# =====
export VISUAL=nvim
export EDITOR="$VISUAL"

# -----
# Path
# =====

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
