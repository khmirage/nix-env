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

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git branch and status for color bash prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
    c_git_clean=$(tput setaf 2)
    c_git_dirty=$(tput setaf 1)
    c_git_semi_dirty=$(tput setaf 3)
    c_reset=$(tput sgr0)
else
    c_git_clean=
    c_git_dirty=
    c_reset=
    c_git_semi_dirty=
fi
 
git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi
 
    git_branch=$(git branch 2> /dev/null | sed -n '/^\*/s/^\* //p')
    if git diff HEAD --quiet 2> /dev/null >&2; then
        git_color="${c_git_clean}"
        dirty=0
    else
        git_color="${c_git_dirty}"
        dirty=1
    fi
 
    if git diff $git_branch origin/$git_branch --quiet 2> /dev/null >&2; then
        git_color="$git_color"
    else
        if [ dirty=0 ]; then
            git_color="${c_git_semi_dirty}"
        fi
    fi
 
    echo " ($git_color$git_branch${c_reset})"
 
}

export ARCHFLAGS="-arch x86_64"
export PATH="$PATH:/usr/local/share/python:$HOME/Bin:$HOME/.rvm/bin"

#the relevant part is $(git_prompt). the following ps will give you a prompt like:
#[username]@hostname [current directory name] (current git branch) $
# export PS1="\[\033[01;32m\]\u@\h\[\033[00m\] \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\] :\[\033[01;34m\]\w\[\033[00m\]\$ "
export PS1='\[\033[01;32m\]\u@\h\[\033[0m\]$(git_prompt) : \[\033[1;34m\]\w\[\033[0m\] \$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# python virtualenvwarpper setting
export WORKON_HOME="$HOME/.virtualenv"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE="$WORKON_HOME"
export PIP_RESPECT_VIRTUALENV=true

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
	source /usr/local/bin/virtualenvwrapper.sh
else
	echo "WARNNING : virtualenvwarpper.sh missing"
fi

