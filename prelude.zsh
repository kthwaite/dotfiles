#-------------------------------------------------------------------------------
#[    prelude                                                                  ]
#-------------------------------------------------------------------------------

# zle uses emacs mode
bindkey -e

#==== Env vars =================================================================
#

# -- language & locale
export LC_ALL='en_GB.UTF-8'
export LC_LANG='en_GB.UTF-8'
export LANG='en_GB.UTF-8'

# -- editor
export EDITOR='nvim'
export VISUAL='nvim'
export VISUDO='nvim'
export SUDO_EDITOR='nvim'

# -- pager
export PAGER='less'


#==== Aliases ==================================================================
#

# -- exa
# default
alias l="exa -alg --group-directories-first"
# as above with git status
alias lg='exa -la --group-directories-first --git'
# invoke regular `ls`
alias ll="ls -alh"
# list directory tree from cwd
alias dt="exa -algbT"
# as above with git status
alias dtg="exa -algbT --git"

# -- pip
alias piu='pip install --upgrade'
alias pipold='pip list --outdated'
alias diskuse='df --si | sort -hk3'

# -- git-log
alias git-log-smp='git log --graph --pretty=oneline --abbrev-commit'
alias git-log-pty='git log --oneline --decorate --all --graph'
alias git-log-mn="git log --pretty=format:'• %C(bold yellow)%h%C(reset) %C(red)%an%C(reset) %C(blue)%ai%C(reset) %C(bold red)%D%C(reset) | %s'"

#==== Functions ================================================================
#

function linetrim() {
    sed -e :a -e '/./,$!d;/^\n*$/{$d;N;};/\n$/ba' $@
}

# ---- version control
# update all git and/or hg repos in the current directory
function pull-all() {
    for dir in */; do
        cd $dir
        echo "Checking $dir..."
        if [ -d ".git/" ]; then
            git pull
        elif [ -d ".hg/" ]; then
            hg pull && hg update
        else
            echo "    $dir is not a git or mercurial repo, skipping..."
        fi
        cd ..
    done
}

# list all git and hg repos in the current directory, prefixed by 'hg' or 'git'
function list-repos() {
    for dir in */; do
        cd $dir
        if [ -d ".git/" ]; then
            git remote -v | awk '/fetch/ {print "git "$2}'
        elif [ -d ".hg/" ]; then
            hg paths default | awk '{print "hg "$1}'
        fi
        cd ..
    done
}

# ---- node.js
function npm-exec {
   $(npm bin)/$@
}
