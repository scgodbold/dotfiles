# Function definitions for zsh
#
# Author: Scott Godbold
# Last Updated: January 7, 2018
#
# Changelog:
#
# 2018.1.7
#   * Created functions.zsh
# ------------------------------------------------------------------------------------
# This makes a function that if there is a job lauch it
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER='fg'
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}

zle -N fancy-ctrl-z         # Bind the job with zsh
bindkey '^z' fancy-ctrl-z   # use ctrl-z to run it, great for use w/ vim
