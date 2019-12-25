#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export BROWSER=firefox
export PATH=$PATH:$HOME/bin
export TERMINAL=kitty
export XDG_CONFIG_HOME=$HOME/.config

if which ruby &> /dev/null && which gem &> /dev/null; then
  PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi

alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lh'

PS1='\342\224\214\e[31m[\t]\e[0m \u:\e[33m\w\e[0m$(__git_ps1 " (%s)")\n\342\224\224\$ '

source /etc/profile.d/autojump.bash
source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/share/git/completion/git-prompt.sh

z() {
  local file
  file="$(find / -executable -type d -not -path '*/\.*' -not -path '*target*' -not -path '*cache*' 2>/dev/null | fzf)"
  cd -- $file
}

n() {
    # Block nesting of nnn in subshells
    if [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, export NNN_TMPFILE after the call to nnn
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
