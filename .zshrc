## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/nathanielgreen/.dart-cli-completion/zsh-config.zsh ]] && . /Users/nathanielgreen/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]



# --- Exports ---

export VISUAL="nvim"
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH" # Homebrew Setup
export ZSH="$HOME/.oh-my-zsh"

# Flutter Setup
export PATH="$PATH":"/usr/local/bin/flutter/bin"
export PATH="$PATH":"/usr/local/bin/flutter/.pub-cache/bin" # Global Executables (Flutter)
export PATH="$PATH":"$HOME/.pub-cache/bin" # Global Executables (Dart)

# Android Tools
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_AVD_HOME="$HOME/.android/avd"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# --- Aliases ---

alias vim="nvim"

# --- Plugins ---

plugins=( 
  zsh-autosuggestions
)

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
source $ZSH/oh-my-zsh.sh
