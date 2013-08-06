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
alias tvon="xrandr --output HDMI-0 --mode 1920x1080 --pos 1368x0 && xrandr --output LVDS --mode 1366x768 && feh --bg-fill /home/fredrik/media/pictures/wallpaper/one\ piece/suits.jpg"
alias tvoff="xrandr --output HDMI-0 --off"
alias matlab="wmname LG3D && ~/bin/matlab/bin/matlab"
alias uimlist="uim-toolbar-gtk"

# Variables
# =========
export LC_CTYPE="en_US.UTF-8"
export TERM="rxvt-unicode-256color"
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
setopt AUTO_CD
unsetopt correct_all

# Key bindings
# ============
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey -s '^U' 'cd ..; ls^M'

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

#function promptchar {
#	hg root >/dev/null 2>/dev/null && echo '☿' && return
#	echo '○'
#}

# Prompt
# ======
export PROMPT="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}:%~> "
export RPROMPT="[$(bugcount)|$(taskcount)]"
#export RPROMPT="[$(promptchar)|$(bugcount)|$(taskcount)]"

