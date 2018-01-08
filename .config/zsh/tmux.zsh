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

if [[ ! $TERM =~ screen ]]; then
        exec tmux  # only tmux if we arent already tmux
fi
