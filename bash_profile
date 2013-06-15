export TERM=xterm-color
export CLICOLOR=true
# export LSCOLORS=ExFxCxDxBxegedabagacad

alias ls='gls --group-directories-first --color=auto'
# alias ls='ls -FGw'
alias ll='ls -lv'
alias lh='ls -lh'
alias la='ls -a'
alias lt='ls -ltr'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# git current branch display prompt
parse_git_branch() {
	if git rev-parse --git-dir > /dev/null 2>&1
	then
		gitver=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
	else
		return 0
	fi
	echo -e $gitver
}

# git branch color
c_green=`tput setaf 2`
c_red=`tput setaf 1`
c_sgr0=`tput sgr0`

branch_color() {
	if git rev-parse --git-dir > /dev/null 2>&1
	then
		color=""
		if git diff --quiet 2>/dev/null >&2
		then
			color="${c_green}"
		else
			color=${c_red}
		fi
	else
		return 0
	fi
	echo -ne $color
}

export PATH="$PATH:$HOME/Bin:$HOME/.rvm/bin"
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\] \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\] :\[\033[01;34m\]\w\[\033[00m\]\$ "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


