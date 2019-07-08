### Misc ZSH Settings
#
# Using this as a home for things that need a home but not
# an entire file

alias q='exit'          # q for exit, so that way I can close things faster

# Set terminal keybindings to vim mode
bindkey -v

export GOPATH=${HOME}/repos/
export WORKON_HOME=${HOME}/.virtualenvs
export TIPZ_TEXT='Alias tip:'
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export PATH=${PATH}:${HOME}/.local/bin/

alias be='bundle exec'
alias tf='terraform'

# Set prompt in zsh
autoload -U promptinit
promptinit
