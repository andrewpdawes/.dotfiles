# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# MY ALIAS
# ============================================================================

# Open applications in tmux
alias mux="./.tmux/muxa.sh"

# Moving up Directory tree
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ........="cd ../../../.."


# Emacs debug
alias edg='emacs --debug-init'

# Git
# General commands:
# Adding files to staging area
alias ga='git add .'
# Commiting changes
alias gc='git commit -m'
# Pushing changes to remote repos
alias gp='git push -u origin master'
# Check the status of files
alias gs='git status'
# Pulling updates from a remote repo. Used when working with other people
alias gpl='git pull --rebase'
# View commit history
alias glo='git log'
# To pull a specific commit into your working copy (add sh1 of the commit after gch)
alias gch='git checkout'
# Merging branches
# To create a new branch (add name of new branch after gbn
alias gbn='git checkout -b'
# To see a list of branches
alias gbl='git branch -a'
# To move to another branch (add name of branch after 'gbm'
alias gbm='git checkout'
alias gbM='git checkout master'
# To merge a branch with the master branch
# First move to master by 'gbM'.Then type gmg and the name of the branch you want to merge with the master branch):
alias gmg='git merge'


# Hledger
# Hledger balance
alias hbe='hledger b --real expenses -S --drop=1 -f ~/Dropbox/administration/finance/2022.ledger'
alias hbe%='hledger b --real expenses -S --flat --drop=1 -% -f ~/Dropbox/administration/finance/2022.ledger'
alias hbl='hledger b --real -f ~/Dropbox/administration/finance/2022.ledger'
alias hbw='hledger b --real --weekly -f ~/Dropbox/administration/finance/2022.ledger'
alias hbm='hledger b --real --monthly -f ~/Dropbox/administration/finance/2022.ledger'
alias hbq='hledger b --real --quarterly -f ~/Dropbox/administration/finance/2022.ledger'
alias hby='hledger b -real --yearly -f ~/Dropbox/administration/finance/2022.ledger'
alias hub='hledger-ui b --real --depth 1 --theme=terminal --watch -f ~/Dropbox/administration/finance/2022.ledger'
alias hwb='hledger-web b --real -f ~/Dropbox/administration/finance/2022.ledger'

# Hledger budgeting
alias hbum='hledger balance -f ~/Dropbox/administration/finance/2022.ledger -MB --budget'
alias hbuq='hledger balance -f ~/Dropbox/administration/finance/2022.ledger -QB --budget'
alias hbuy='hledger balance -f ~/Dropbox/administration/finance/2022.ledger -YB --budget'

# Hledger incomestatement
alias hi='hledger is --real -f ~/Dropbox/administration/finance/2022.ledger'
alias hiw='hledger is --real --weekly -f ~/Dropbox/administration/finance/2022.ledger'
alias him='hledger is --real --monthly -f ~/Dropbox/administration/finance/2022.ledger'
alias hiq='hledger is --real --quarterly -f ~/Dropbox/administration/finance/2022.ledger'
alias hiy='hledger is --real --yearly -f ~/Dropbox/administration/finance/2022.ledger'

# Hledger register
alias hura='hledger-ui register --real amazon --watch --theme=terminal -f ~/Dropbox/administration/finance/2022.ledger'
alias hurc='hledger-ui register --real charity --watch  --theme=terminal -f ~/Dropbox/administration/finance/2022.ledger'
alias hurg='hledger-ui register --real groceries --watch --theme=terminal -f ~/Dropbox/administration/finance/2022.ledger'
alias hurr='hledger-ui register --real rent --watch --theme=terminal -f ~/Dropbox/administration/finance/2022.ledger'
alias hat='hledger accounts --tree --real -f ~/Dropbox/administration/finance/2022.ledger'

# Hledger stats
alias hs='hledger stats --real -f ~/Dropbox/administration/finance/2022.ledger'

# Hledger tags
alias ht='hledger tags --real -f ~/Dropbox/administration/finance/2022.ledger'


# Taskwarrior:
alias t='task'
alias ta='task add'
alias td='task delete'
alias tm='task mod '
alias tr='task report'
alias tt='task +TODAY list'
alias tw='task +WEEK list'
alias tmth='task +MONTH list'
alias tq='task +3MONTHS list'
alias tbd='task burndown.daily'
alias tbw='task burndown.weekly'
alias tbm='task burndown.monthly'
alias thm='task history.monthly'
alias thy='task history.annual'

# Timewarrior
alias tmy='timew summary :yesterday'
alias tmw='timew summary :week'
alias tmlw='timew summary :lastweek'
alias tmm='timew summary :month'
alias tmq='timew summary :quarter'
alias tmyear='timew summary :year'

# Hledger
# alias £='hledger '
# ============================================================================
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export LEDGER_FILE=/home/heedypo/Dropbox/administration/finance/2022.ledger


eval "$(thefuck --alias)"
