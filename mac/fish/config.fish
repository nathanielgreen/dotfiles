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

# Docker
export PATH="/usr/local/bin:$PATH"

# Android Tools
export ANDROID_HOME="/Users/nathanielgreen/Library/Android/sdk"
export ANDROID_SDK_ROOT="/Users/nathanielgreen/Library/Android/sdk"
export ANDROID_AVD_HOME="/Users/nathanielgreen/.android/avd"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"




# -----
# Aliases
# =====

alias vim="nvim"
