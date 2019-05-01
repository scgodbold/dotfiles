### History Defaults

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Define history dependant variables
export HISTSIZE=50000
export SAVEHIST=10000
export HISTFILE=${HOME}/.zsh_history


# Vim mode disables reverse history search, fix that
bindkey '^R' history-incremental-search-backward

function history_context() {
    local PARAMS=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -b|--before)
                local before="${2}"
                shift 2
                ;;
            -a|--after)
                local after="${2}"
                shift 2
                ;;
            -*|--*)  # Break out on unknown options
                echo "Unknown option provided ${1}"
                return 1
                ;;
            --)
                shift
                break
                ;;
            *)
                local PARAMS="${PARAMS} ${1}"
                shift
                ;;
        esac
    done

    eval set -- "${PARAMS}"

    if [ -z "${before}" ]; then
        local before=20
    fi

    if [ -z "${after}" ]; then
        local after=20
    fi

    if [ ${#} -eq 0 ]; then
        cat <<EOF
Usage: history_context [options] [query]

    Options:
        -[a]fter n      Print n lines after first result
        -[b]efore n     Print n lines before first result

    Query is a command to find in history, returns first result found
EOF
    fi
    local query="${@}"
    local hist_file="${HISTFILE-~/.history}"

    local cmd_line=$(grep --color=never -n -m 1 ${query} ${hist_file} | cut -d':' -f1)
    local startline=$(expr $cmd_line - $before)
    local endline=$(expr $cmd_line + $after)
    local hist_size=$(wc -l ${HISTFILE} | cut -d' ' -f1)
    if [ ${startline} -lt 0 ]; then
        ${startline}=0
    fi
    if [ ${endline} -gt ${hist_size} ]; then
        endline=${hist_size}
    fi
    fc -l ${startline} ${endline}
    return 0
}

# Plz
alias pls='sudo $(fc -ln -1)'
