zstyle -s ":vcs_info:git:*:-all-" "command" git

function _git_update_master () {
    git rev-parse --git-dir 2>&1 > /dev/null
    if [ "$?" -ne "0" ]; then
        return 1
    fi
    local cur_branch=$(git symbolic-ref --short HEAD)
    git checkout master
    git pull origin master
    git checkout "${cur_branch}"
}


alias g='git'

alias gl='git pull'
alias gc='git commit -v'
alias gb='git branch'
alias gp='git push'
alias gd='git diff'

alias ga='git add'
alias gau='git add --update'
alias gaa='git add --all'


alias gst='git stash'
alias gstp='git stash pop'


alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'

alias gss='git status --short'
alias gstl='git status'

alias gsn='git shortlog -sn'

alias gupm='_git_update_master'

function gerrit_review() {
    local PARAMS=""
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -d|--draft)
                local cmd="drafts"
                shift
                ;;
            -b|--branch)
                local branch="${2}"
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

    if [ -z ${branch} ]; then
        local branch="master"
    fi

    if [ -z ${cmd} ]; then
        local cmd="publish"
    fi

    if [ "$#" -eq "0" ]; then
        git push origin HEAD:refs/${cmd}/${branch}
        return 0
    fi

    if [ "$#" -eq "1" ]; then
        git push origin HEAD:refs/${cmd}/${branch}/"$1"
        return 0
    fi

    cat <<EOF
Usage: gerrit_review [options] [topic]

    Options:
        -[-d]raft       Sets the review as a draft and will not actually publish it for review
        -[-b]ranch      Sets which branch the review is for, defaults to "master"

    TOPIC - An optional argument that sets the topic of the review, will be omited if not provided
EOF
    return 1
}

alias gaar='git add -u && git commit --amend --no-edit && git review'


# Add some yadm commands too since its mostly git
alias yau='yadm add -u'
alias yc='yadm commit'
alias yp='yadm push'
alias yl='yadm pull'
alias yst='yadm stash'
alias ystp='yadm stash pop'
alias yd='yadm diff'
