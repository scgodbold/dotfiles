### Setup Clipboard settings

# The idea here is this is not mission critical, but nice to have
# Try to load it if possible otherwise move along
if ! (( $+commands[clipboard] )); then
    if (( $+commands[npm] )); then
        pushd ${HOME}
        npm install clipboard-cli
        popd
        ln -s $(npm bin)/clipboard ${HOME}/.bin/clipboard
    fi
fi
if (( $+commands[clipboard] )); then
    alias cb='clipboard'
fi


