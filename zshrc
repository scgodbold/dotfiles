# ZSHRC for Scott Godbold
# Last Updated: January 11, 2016
# Installation Requirements:
#   tmux                (however you wish to get it)
#   virtualenv          (pip)
#   virtualenvwrapper   (pip)
#   oh my zsh           (https://github.com/robbyrussell/oh-my-zsh)
# Also depends on the following dirs
#   ~/
#   |-.virtualenvs

# This is over documented but maybe in the future it will be needed :D

# ------------------------------------------------------------------------------------

# Table of Contents                                                         *contents*

#   01. Tmux .............................................................. |set_tmux|
#   02. Oh My ZSH Config ................................................. |oh_my_zsh|
#   03. Custom Aliases .............................................. |custom_aliases|
#   04. Python Virtualenv ................................................... |py_env|
#   05. Enviroment Variables .............................................. |env_vars|

# ------------------------------------------------------------------------------------
# 01. Tmux                                                                  *set_tmux*
# ------------------------------------------------------------------------------------
if [[ ! $TERM =~ screen ]]; then
        exec tmux  # only tmux if we arent already tmux
fi

# ------------------------------------------------------------------------------------
# 02. Oh My ZSH Config                                                     *oh_my_zsh*
# ------------------------------------------------------------------------------------
ZSH=$HOME/.oh-my-zsh                                    # Change our zsh Path to OMZSH
ZSH_THEME="nicoulaj"                                    # Set our theme
plugins=(git last-working-dir pip sudo python vi-mode)  # And dont forget the plugins
bindkey -v                                              # Vim Mode, cause this is a vim shop
source $ZSH/oh-my-zsh.sh                                # source that isssh


# ------------------------------------------------------------------------------------
# 03. Custom Aliases                                                  *custom_aliases*
# ------------------------------------------------------------------------------------
# misc, but important things, save all the key strokes
alias v='vim'
alias q='exit'

# Git things
alias gs='git status -s'

# tmux things
alias ts='tmux new -s'
alias ta='tmux attach -t'
alias td='tmux detach-client'

# My custom scripts
alias flaskify='~/repos/dotfiles/scripts/flask_strap.sh'

# ------------------------------------------------------------------------------------
# 04. Python Virtualenv                                                       *py_env*
# ------------------------------------------------------------------------------------
export WORKON_HOME=$HOME/.virtualenvs                   # Where all the virtualenvs will go
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/.virtualenvs    # Where virtualenv hooks are located
source /usr/local/bin/virtualenvwrapper.sh              # source the wrapper for easy mode


# ------------------------------------------------------------------------------------
# 05. Enviroment Variables                                                  *env_vars*
# ------------------------------------------------------------------------------------
# Build the path, its important
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export EDITOR='vim'     # Is there any other editor really?
export HISTSIZE=10000   # All the history, so I can look back to the dawn of time (but not really)
