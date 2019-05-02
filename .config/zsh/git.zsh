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

alias gaar='git add -u && git commit --amend --no-edit && git review'


# Add some yadm commands too since its mostly git
alias yss='yadm status --short'
alias ya='yadm add'
alias yau='yadm add -u'
alias yc='yadm commit'
alias yp='yadm push'
alias yl='yadm pull'
alias yst='yadm stash'
alias ystp='yadm stash pop'
alias yd='yadm diff'
