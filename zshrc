# TMUX!!!!!
if [[ ! $TERM =~ screen ]]; then
        exec tmux
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Vi mode
bindkey -v

# Of course vim what you even thinkin
export EDITOR='vim'

# History Size
export HISTSIZE=10000

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="nicoulaj"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v='vim'
alias q='exit'
alias gs='git status -s'
alias ts='tmux new -s'
alias ta='tmux attach -t'
alias td='tmux detach-client'

# Python Virtual Enviroments
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


# Set oh my zsh plugins
plugins=(git last-working-dir pip sudo)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
