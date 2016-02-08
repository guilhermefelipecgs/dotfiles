
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT_FAMILY="Monospace-14"
export EDITOR='vim'
export BROWSER='firefox'
export QT_STYLE_OVERRIDE=GTK+
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY
export PATH=$PATH:$HOME/bin

alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lh'

#PS1='[\u@\h \W]\$ '
PS1='\342\224\214\e[31m[\t]\e[0m \u:\e[33m\w\e[0m\n\342\224\224\$ '

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

