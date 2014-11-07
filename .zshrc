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
alias hyde_regen="hyde -g -s ."
alias top="htop"
alias t="python2 /home/fredrik/bin/t/t.py --task-dir ~/bin/t/tasks --list tasks"
alias b="python2 /home/fredrik/bin/t/t.py --task-dir . --list .bugs"
alias tvon="xrandr --output HDMI-0 --mode 1920x1080 --pos 1368x0 && xrandr --output LVDS --mode 1366x768 && feh --bg-fill /home/fredrik/media/pictures/wallpaper/cubic.jpg"
alias workon="xrandr --output VGA-0 --mode 1680x1050 --left-of LVDS --rotate right && xrandr --output LVDS --mode 1366x768 && feh --bg-fill /home/fredrik/media/pictures/wallpaper/chrono-trinity1920x1080.jpg"
alias tvoff="xrandr --output HDMI-0 --off"
alias workoff="xrandr --output VGA-0 --off"
alias matlab="wmname LG3D && ~/bin/matlab/bin/matlab"
alias mendeley="~/bin/mendeleydesktop/bin/mendeleydesktop"
alias uimlist="uim-toolbar-gtk"
alias postman="chromium --app-id=fhbjgbiflinjbdggehcddcbncdddomop"

# Variables
# =========
export LC_CTYPE="en_US.UTF-8"
export TERM="rxvt-unicode-256color"
export EDITOR="vim"
export VISUAL="vim"
export PATH=$PATH:/home/fredrik/.gem/ruby/2.1.0/bin

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

