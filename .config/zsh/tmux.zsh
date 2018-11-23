# Tmux config for zsh
#
# Author: Scott Godbold
# Last Updated: January 7, 2018
#
# Changelog:
#
# 2018.1.7
#   * Created tmux module
# ------------------------------------------------------------------------------------

export TMUXP_CONFIGDIR=${HOME}/.config/tmuxp
export DISABLE_AUTO_TITLE='true'
local tmux_bin=$(which tmux)
if [[ ! $TERM =~ screen ]]; then
    # I guess new is what I wanted here :/ whatever
    exec ${tmux_bin} new -A -s default
fi
