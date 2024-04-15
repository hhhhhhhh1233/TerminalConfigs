# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tage/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
# End of lines added by compinstall

autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

export KEYTIMEOUT=5

setopt MENU_COMPLETE
setopt no_list_ambiguous
#setopt prompt_subst
#NEWLINE=$'\n'
#PS1='%n@%m %F{red}%/%f$vcs_info_msg_0_ $NEWLINE$ '

prompt adam2
