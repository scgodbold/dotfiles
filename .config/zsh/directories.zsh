### Directory Defaults

# Export directories and path
export PATH=${PATH}:/usr/local/bin:${HOME}/.local/bin:${HOME}/.bin:${HOME}/bin
export PROJECT_DIR="${HOME}/repos/src"

# Set options
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt autocd
zstyle ':completion:*' menu select

# General Traversal Improvements
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Shorten some common ls tasks
alias ls='ls --color=auto'
alias ll='ls -lhtr --color=auto'
alias la='ls -lhatr --color=auto'

# Define faster movement within projects via project jump
projectjump () {
    local PARAMS=""
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -d|--debug)
                set -x
                DEBUG=true
                shift
                ;;
            -b|--base-dir)
                local BASEDIR="${2}"
                shift 2
                ;;
            -*|--*)  # Quit if bad args passed in
                echo "Unknown option provided: $1"
                exit 1
                ;;
            --) # End arg parsing
                shift
                break
                ;;
            *)  # Handle postional args
                local PARAMS="$PARAMS $1"
                shift
                ;;
        esac
    done
    eval set -- "$PARAMS"


    if [ -z $BASEDIR ]; then
        # Set basedir to home if not specified
        local BASEDIR="${HOME}"
    fi

    local target_dir="${1}"
    if [ -z ${1} ]; then
        echo "Must specify a directory to jump to"
    fi

    cd ${BASEDIR}/${target_dir}
}
alias pj="projectjump -b ${PROJECT_DIR}"
alias pjg="projectjump -b ${PROJECT_DIR}/github.com"
alias pjgl="projectjump -b ${PROJECT_DIR}/gitlab.com"
