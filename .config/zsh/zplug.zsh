export ZPLUG_HOME=${HOME}/.zplug

if [[ ! -f ${ZPLUG_HOME}/init.zsh ]]; then
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
	source ${ZPLUG_HOME}/init.zsh
	zplug update --self
fi

source ${ZPLUG_HOME}/init.zsh

zplug zplug/zplug, hook-build:"zplug --self-manage"
zplug mafredri/zsh-async
zplug "ahmedelgabri/pure", depth:1, use:"{async,pure}.zsh", as:theme
zplug zdharma/fast-syntax-highlighting
zplug molovo/tipz
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-history-substring-search
zplug chrissicool/zsh-256color
zplug "zsh-users/zsh-completions"
zplug "paulirish/git-open", as:plugin
zplug "plugins/colored-man-pages", from:oh-my-zsh

if ! zplug check;  then
	zplug install
fi
