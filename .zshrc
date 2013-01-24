autoload -U colors compinit
colors
compinit

# Aliases
# =======
alias ls="ls --color"
alias ll="ls -lah"
alias lh="ls -Ad .*"
alias l="ls"
alias hyde="/home/fredrik/bin/hyde/hyde.py"
alias t="python2 /home/fredrik/bin/t/t.py --task-dir ~/bin/t/tasks --list tasks"
alias b="python2 /home/fredrik/bin/t/t.py --task-dir . --list .bugs"

# Variables
# =========
export EDITOR="vim"
export VISUAL="vim"

# Tab completion
# ==============
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*' list-colors ${(s/:/)LS_COLORS}
zstyle ':completion:*:*:kill*:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:kill*:*' menu yes select

# Misc fixes
# ==========
unsetopt correct_all
bindkey -v

# Functions
# =========
function taskcount {
	echo $(t |wc -l | sed -e's/ *//')
}

function bugcount {
	count=$(b | wc -l | sed -e's/ *//')
	if [[ $count == 0 ]]; then
		echo %{$fg[green]%}0%{$reset_color%}
	else
		echo %{$fg[red]%}0%{$reset_color%}
	fi
}

function promptchar {
	hg root >/dev/null 2>/dev/null && echo '☿' && return
	echo '○'
}

# Prompt
# ======
export PROMPT="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}:%d% > "
export RPROMPT="[$(promptchar)|$(bugcount)|$(taskcount)]"

