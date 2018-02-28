# Oh My ZSH config
#
# Author: Scott Godbold
# Last Updated: January 8, 2018
#
# Changelog:
#
# 2018.1.8
#   * Change to use spaceship theme
# 2018.1.7
#   * Created oh my zsh config
# ------------------------------------------------------------------------------------

ZSH="${HOME}/.oh-my-zsh"                                        # Change our zsh Path to OMZSH
plugins=(git pip sudo python vi-mode history kitchen knife)  # And dont forget the plugins
bindkey -v                                                      # Vim Mode, cause this is a vim shop
source "${ZSH}/oh-my-zsh.sh"                                    # source that isssh
ZSH_THEME="refined"                                           # Set our theme, after source, we let zplug handle this

ZSH_AUTOSUGGEST_USE_ASYNC=true
TIPZ_TEXT='Alias tip:'
