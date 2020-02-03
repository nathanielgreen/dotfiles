# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Path to your oh-my-zsh installation.
export ZSH="/home/ngreen/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-z)

source $ZSH/oh-my-zsh.sh

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Bullet Train Zsh Theme
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  dir
  git
  nvm
)
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_NVM_FG=black
BULLETTRAIN_KCTX_FG=black

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export VISUAL=vim
export EDITOR="$VISUAL"

# Asciiquarium shit
PATH="/home/ngreen/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ngreen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ngreen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ngreen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ngreen/perl5"; export PERL_MM_OPT;

# Kubernetes Config
export KUBECONFIG=~/.config/kubeconfig

# Add Linuxbrew to path
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

function gitstart () {
  local board_initials=$1
  local board_initials_upper=$(echo $board_initials | tr a-z A-Z)
  local ticket_number=$2
  shift
  shift
  local ticket_name="$*"
  local kebab_case_ticket_name=$(echo $ticket_name | sed 's/\.//g' | sed 's/\,//g' | sed 's/://g' | sed 's/ - /-/g' | sed 's/ /-/g' | tr A-Z a-z)
  local new_branch_name="task/$board_initials-$ticket_number-$kebab_case_ticket_name"
  local current_branch_name=$(git rev-parse --abbrev-ref HEAD)
  local pull_request_name=$(echo -e "[$board_initials_upper-$ticket_number] (Task) $ticket_name\n\n[$board_initials_upper-$ticket_number]")
#   echo $board_initials
#   echo $board_initials_upper
#   echo $ticket_number
#   echo $ticket_name
#   echo $kebab_case_ticket_name
# echo $pull_request_name
  git pull
  git checkout -b $new_branch_name
  git commit --allow-empty -m "$board_initials_upper-$ticket_number: Initial Commit"
  git push --set-upstream origin $new_branch_name
  hub pull-request -d -b $current_branch_name -m  $pull_request_name
}
