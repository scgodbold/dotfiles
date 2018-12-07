### ZSH config file
#
# Author: Scott Godbold
#
# Responsible for including other files in proper order
ZDOT_DIR="${HOME}/.config/zsh"

# Standards
source "${ZDOT_DIR}/tmux.zsh"
source "${ZDOT_DIR}/zplug.zsh"
source "${ZDOT_DIR}/directories.zsh"
source "${ZDOT_DIR}/grep.zsh"
source "${ZDOT_DIR}/editor.zsh"
source "${ZDOT_DIR}/docker.zsh"
source "${ZDOT_DIR}/direnv.zsh"
source "${ZDOT_DIR}/clipboard.zsh"
source "${ZDOT_DIR}/git.zsh"
source "${ZDOT_DIR}/misc.zsh"
source "${ZDOT_DIR}/history.zsh"

# Allow for temporary local changes that do not need to be source controlled
if [ -e "${ZDOT_DIR}/local.zsh" ]; then
    source "${ZDOT_DIR}/local.zsh"
fi

# On more post load, themes didn't work till I did this
if ! zplug check;  then
	zplug install
fi
zplug load
