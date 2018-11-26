export ZPLUG_HOME=${HOME}/.zplug

if [[ ! -f ${ZPLUG_HOME}/init.zsh ]]; then
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
	source ${ZPLUG_HOME}/init.zsh
	zplug update --self
fi

source ${ZPLUG_HOME}/init.zsh

# Overhead stuff
zplug zplug/zplug, hook-build:"zplug --self-manage"
zplug mafredri/zsh-async

# Theme
zplug sindresorhus/pure, use:"{async,pure}.zsh", from:github, as:theme

# Formatting and Syntax highlighting
zplug "plugins/colored-man-pages", from:oh-my-zsh, defer:3
zplug zdharma/fast-syntax-highlighting
zplug chrissicool/zsh-256color

# Reminders
zplug molovo/tipz, defer:3

# History searching
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-history-substring-search

# Tab completion plugins
zplug "plugins/kitchen", from:oh-my-zsh, defer:2
zplug "plugins/docker", from:oh-my-zsh, defer:2
zplug "plugins/knife", from:oh-my-zsh, defer:2
zplug "plugins/terraform", from:oh-my-zsh, defer:2
zplug "zsh-users/zsh-completions"

# Web plugins
zplug "paulirish/git-open", as:plugin, defer:3



bindkey -v                                                      # Vim Mode, cause this is a vim shop

if ! zplug check;  then
	zplug install
fi
