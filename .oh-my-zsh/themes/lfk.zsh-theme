PROMPT='%{$fg[blue]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}:%d% > '
RPROMPT='[$(promptchar)|$(bugcount)|$(taskcount)]'

function promptchar {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	hg root >/dev/null 2>/dev/null && echo '☿' && return
	echo '○'
}

function bugcount {
	count=$(b | wc -l | sed -e's/ *//')
	if [[ $count == 0 ]]; then
		echo %{$fg[green]%}0%{$reset_color%}
	else
		echo %{$fg[red]%}$count%{$reset_color%}
	fi
}

function taskcount {
	echo $(t | wc -l | sed -e's/ *//')
}
