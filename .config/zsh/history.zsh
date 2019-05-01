### History Defaults

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Define history dependant variables
export HISTSIZE=50000
export SAVEHIST=10000
export HISTFILE=${HOME}/.zsh_history


# Vim mode disables reverse history search, fix that
bindkey '^R' history-incremental-search-backward

# Plz
alias pls='sudo $(fc -ln -1)'
