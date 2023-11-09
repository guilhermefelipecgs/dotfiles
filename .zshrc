# Enabl Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/guilherme/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# exports
export EDITOR=vim
export JDTLS_JVM_ARGS=-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar

# alias
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lh'
alias grep='grep --color=auto'
alias v='nvim'

zstyle ':completion:*' menu select

precmd () { print -Pn "\e]2;%n@%m:%~\a" }

bindkey -v '^?' backward-delete-char
bindkey -v '^[[H' beginning-of-line
bindkey -v "^[[F"  end-of-line
bindkey -v "^[[3~" delete-char
bindkey -v "^[[5~" up-line-or-history
bindkey -v "^[[6~" down-line-or-history
bindkey -v "^[[1;5D" backward-word
bindkey -v "^[[1;5C" forward-word
bindkey -v '^H' backward-kill-word
bindkey -v '^[[3;5~' kill-word
bindkey -v '^Z' undo
bindkey -v '^R' redo

# sources
. /usr/share/doc/pkgfile/command-not-found.zsh
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
eval "$(zoxide init zsh)"
. /opt/asdf-vm/asdf.sh
eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
