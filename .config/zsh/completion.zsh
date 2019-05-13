setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt PATH_DIRS
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
unsetopt MENU_COMPLETE

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOT_DIR}/.zcompcache"
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

zstyle ':completion:*' squeeze-slashes true
