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
