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
ZSH_THEME="spaceship"                                           # Set our theme
plugins=(git last-working-dir pip sudo python vi-mode history)  # And dont forget the plugins
bindkey -v                                                      # Vim Mode, cause this is a vim shop
source "${ZSH}/oh-my-zsh.sh"                                    # source that isssh

# Configure the theme
SPACESHIP_PROMPT_ORDER=(
time
vi_mode
venv
git_branch
line_sep
dir
char
)

SPACESHIP_PROMPT_DEFAULT_PREFIX=" "
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=black
SPACESHIP_TIME_PREFIX=""
SPACESHIP_VENV_PREFIX="("
SPACESHIP_VENV_SUFFIX=") "
SPACESHIP_VENV_COLOR=black
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_SUFFIX=" "
SPACESHIP_DIR_COLOR=blue
SPACESHIP_GIT_BRANCH_PREFIX="("
SPACESHIP_GIT_BRANCH_SUFFIX=") "
SPACESHIP_GIT_BRANCH_COLOR=black
SPACESHIP_VI_MODE_COLOR=black
