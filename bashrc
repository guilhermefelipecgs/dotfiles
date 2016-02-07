
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='vim'
export BROWSER='firefox'

alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lh'
alias dmenu="dmenu -nb '#181818' -nf '#585858' -sb '#7cafc2' -sf '#181818'"

#PS1='[\u@\h \W]\$ '
PS1='\e[31m[\t]\e[0m \u:\e[33m\w\e[0m\n\$ '

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

