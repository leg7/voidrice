export PAGER="less"
export LESS="R" # Less default options (inhibits git from calling less with -F and -R)
export EDITOR="nvim"

export ASAN_OPTIONS="halt_on_error=0"
export FZF_DEFAULT_OPTS="--ansi --layout reverse --color fg:-1,fg+:-1,bg:-1,bg+:-1,hl:-1,hl+:-1,query:-1,gutter:-1"

# Make programs use xdg dirs by default
XDG_RUNTIME_DIR="/run/user/$(id -u)"
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"
export XDG_RUNTIME_DIR

export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$PATH:$HOME/.local/bin:${XDG_DATA_HOME}/npm/bin"

export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass"
export MBSYNCRC="${XDG_CONFIG_HOME}/isync/mbsyncrc"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export GHCUP_USE_XDG_DIRS="true"
export STARSHIP_CACHE="${XDG_CACHE_HOME}/starship"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export WINEPREFIX="${XDG_DATA_HOME}/wine"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export ANDROID_USER_HOME="${XDG_DATA_HOME}/android"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export LEIN_HOME="${XDG_DATA_HOME}/lein"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"

# DE env
export _JAVA_AWT_WM_NONREPARENTING=1
export BROWSER="firefox"

stty -ixon

set -o vi

bind '"\C-w":"source fuzzy-change-directory\n"'
bind '"\C-p":"fuzzy-copy-path\n"'
bind '"\C-f":"fuzzy-xdg-open\n"'
bind '"\C-h":"fuzzy-copy-history\n"'
bind '"\C-l":"ls -lhv --group-directories-first --color=always\n"'
bind '"\C-s":"setsid -f footclient\n"'
bind '"\C-t":"task\n"'

alias t="task"

alias l="ls -lhv --group-directories-first"
alias ll="ls -lAhv --group-directories-first"

alias g="git"
alias gd="git diff"
alias gds="git diff --staged"
alias gc="git commit"
alias gca="git commit --amend"
alias gs="git status"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
