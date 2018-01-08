# Oh My ZSH config
#
# Author: Scott Godbold
# Last Updated: January 7, 2018
#
# Changelog:
#
# 2018.1.7
#   * Created oh my zsh config
# ------------------------------------------------------------------------------------

ZSH="${HOME}/.oh-my-zsh"                                        # Change our zsh Path to OMZSH
ZSH_THEME="nicoulaj"                                            # Set our theme
plugins=(git last-working-dir pip sudo python vi-mode history)  # And dont forget the plugins
bindkey -v                                                      # Vim Mode, cause this is a vim shop
source "${ZSH}/oh-my-zsh.sh"                                    # source that isssh
