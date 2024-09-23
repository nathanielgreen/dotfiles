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
export PATH="$PATH:$HOME/google-cloud-sdk/bin"
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
export JAVA_HOME="/Users/nathanielgreen/Library/Java/JavaVirtualMachines/corretto-17.9.10/Contents/Home"

export PATH="/Users/nathanielgreen/.shorebird/bin:$PATH"

# --- Aliases ---

alias vim="nvim"
alias htop='btop'
alias docu='docker compose -f docker-compose.yml -f docker-compose.mac.yml up -d'
alias docd='docker compose down'
alias gitlh='git log -n 1 --pretty=format:"%H" | pbcopy' # Copies latest git hash to clipboard


# --- Plugins ---

plugins=( 
  zsh-autosuggestions
)

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
source $ZSH/oh-my-zsh.sh



. /opt/homebrew/opt/asdf/libexec/asdf.sh



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nathanielgreen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nathanielgreen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nathanielgreen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nathanielgreen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

