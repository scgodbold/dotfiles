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

if [[ ! $TERM =~ screen ]]; then
    for env in $(ls ${TMUXP_CONFIGDIR} | grep yaml | grep -v default); do
        /usr/local/bin/tmuxp load -d $(echo ${env} | cut -d'.' -f1) 2>&1 > /dev/null &
    done
        exec /usr/local/bin/tmuxp load default # only tmux if we arent already tmux
fi
