# Tmux config for zsh

export DISABLE_AUTO_TITLE=true
local tmux_bin=$(which tmux)
if [[ ! $TERM =~ screen ]]; then
    # I guess new is what I wanted here :/ whatever
    exec ${tmux_bin} new -A -s default
fi
