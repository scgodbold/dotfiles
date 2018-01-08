# Aliases for zsh
#
# Author: Scott Godbold
# Last Updated: January 7, 2018
#
# Changelog:
#
# 2018.1.7
#   * Create aliases.zsh
# ------------------------------------------------------------------------------------
#
# misc, but important things, save all the key strokes
alias v='nvim'                                               # v for vim, no more 3 letter editing
alias vi='nvim'                                              # v for vim, no more 3 letter editing
alias vim='nvim'                                             # v for vim, no more 3 letter editing
alias q='exit'                                               # q for exit, so that way I can close things faster

# Git things
alias gs='git status -s'                                    # gs runs git status in short mode

# tmux things
alias ts='tmux new -s'                                      # Create a new tmux session
alias ta='tmux attach -t'                                   # attach to the given tmux session
alias td='tmux detach-client'                               # detach from tmux client

# My custom scripts
bindkey '^R' history-incremental-search-backward            # Vim mode disables reverse search, fix that