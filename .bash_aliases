function mcd {
    mkdir -p "$1" && cd "$1";
}
function gr {
    grep -nr --color=always $1 . 2>/dev/null | grep -vEe '.git|node_modules'
}
function remote {                                                                                                                                                                                                  
    BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`                                                                                                                                                           
    REMOTE=`git config --get remote.origin.url | sed -e 's/\:/\//' -e 's/git@//' -e 's/.git//' -e 's/https:\/\///'`                                                                                                
    open https://$REMOTE/tree/$BRANCH                                                                                                                                                                              
}
alias egr='egrep -snr --color=always'
alias ll='ls -halF'
alias ss='du -sh'
