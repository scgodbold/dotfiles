# Environment Variables for zsh
#
# Author: Scott Godbold
# Last Updated: January 7, 2018
#
# Changelog:
#
# 2018.1.7
#   * Created env_vars.zsh
# ------------------------------------------------------------------------------------
# Build the path, its important
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:${HOME}/.local/bin

export EDITOR='nvim'     # Is there any other editor really?
export HISTSIZE=10000    # All the history, so I can look back to the dawn of time (but not really)
export PROJECT_DIR="${HOME}/repos/src"

export DISABLE_AUTO_TITLE=true
export GOPATH=${HOME}/repos/
export WORKON_HOME=${HOME}/.virtualenvs
export TIPZ_TEXT='Alias tip:'
export ZSH_AUTOSUGGEST_USE_ASYNC=true

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=50000
export SAVEHIST=10000
