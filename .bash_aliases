function port {
    lsof -n -i4TCP:$1 | grep LISTEN
}
function gr {
    find  ${2:-.} ! -path '*.git*' ! -path '*node_modules*' -type f | xargs grep -nri --color=always $1 2>/dev/null
}

function remote {
    BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    REMOTE=`git config --get remote.origin.url | sed -e 's/\:/\//' -e 's/git@//' -e 's/.git//' -e 's/https:\/\///'`
    open https://$REMOTE/tree/$BRANCH
}
alias ll='ls -halF'
alias egr='egrep -snr --color=always'
alias ss='du -sh'
alias um="git fetch origin master:master && git merge master"
alias usage="ls -a | xargs -I{}  du -hs {}"

function ulimit() { builtin ulimit -n 1024; }
export -f ulimit
