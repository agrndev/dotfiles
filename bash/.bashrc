#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.dotnet/tools:$PATH"


export BROWSER="chromium"
export EDITOR="nvim"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias new-session='$HOME/.config/tmux/new-session.sh'
alias load-session='$HOME/.config/tmux/load-session.sh'
alias remove-session='$HOME/.config/tmux/remove-session.sh'

PS1='\[\e[0m\]\u\[\e[0;2m\]@\[\e[0m\]\h \[\e[0m\](\[\e[0m\]\W\[\e[0m\]) \[\e[0;1m\]> \[\e[0m\]'

if command -v tmux >/dev/null 2>&1 && [[ -z "$TMUX" ]]; then
  tmux attach -t main 2>/dev/null || tmux new -s main
fi

