
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export BROWSER=firefox
export QT_STYLE_OVERRIDE=gtk2
export PATH=$PATH:$HOME/bin
export TERMINAL=termite

if which ruby &> /dev/null && which gem &> /dev/null; then
  PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi

alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lh'

#PS1='[\u@\h \W]\$ '
PS1='\342\224\214\e[31m[\t]\e[0m \u:\e[33m\w\e[0m\n\342\224\224\$ '

source /usr/share/doc/pkgfile/command-not-found.bash

if [[ $DISPLAY == :0 ]]; then
  neofetch --ascii
fi
