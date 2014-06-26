function mcd {
    mkdir -p "$1" && cd "$1";
}
function gr {
    grep -nr --color=always $1 . 2>/dev/null | grep -vEe '.git|node_modules'
}
alias egr='egrep -snr --color=always'
alias ll='ls -halF'
alias ss='du -sh'
