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
if [[ ! $TERM =~ screen ]]; then
    exec /usr/bin/tmux attach -t default # only tmux if we arent already tmux
fi
