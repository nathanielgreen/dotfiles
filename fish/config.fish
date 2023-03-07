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

# NNN Config
export NNN_OPTS="deio"


# -----
# Aliases
# =====

alias vim="nvim"
alias dcup="docker-compose up -d"
alias dcdo="docker-compose down"
alias quadscreen='displayplacer "id:8E338A58-9E07-4871-A1BD-C143D00BF721 res:2560x1440 hz:60 color_depth:8 scaling:off origin:(0,0) degree:0" "id:8B47AF5A-222E-45C4-A5D7-4AB91321B078 res:2560x2880 hz:60 color_depth:8 scaling:off origin:(2560,-1440) degree:0" "id:230BB08D-4F29-4C1B-B24A-72FCD00E2455 res:2560x2880 hz:60 color_depth:7 scaling:off origin:(-2560,-1440) degree:0"'
alias triplescreen='displayplacer "id:8B47AF5A-222E-45C4-A5D7-4AB91321B078 res:2560x2880 hz:60 color_depth:7 scaling:off origin:(0,0) degree:0" "id:230BB08D-4F29-4C1B-B24A-72FCD00E2455 res:2560x2880 hz:60 color_depth:7 scaling:off origin:(-5120,0) degree:0" "id:8E338A58-9E07-4871-A1BD-C143D00BF721 res:2560x2880 hz:60 color_depth:7 scaling:off origin:(-2560,0) degree:0"'
