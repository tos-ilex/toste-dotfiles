#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;32m\][\u@\h \W]\$ \[\e[0m\]'


if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

PATH=$PATH:~/scripts:~/.local/bin:~/go/bin:~/.dotnet/tools

alias gs="git status"
alias gco="git add . && git commit"
alias gcp="gco && git push"
alias gcamp="gco --amend && git push -f"
alias gfrom="git fetch && git rebase origin/master"
alias gfrompc="git fetch && git rebase origin/main"

alias kubectx="kubectl config use-context"

export EDITOR=nvim
export ASPNETCORE_ENVIRONMENT=Local
