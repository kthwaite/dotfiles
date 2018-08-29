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

alias l='exa -la --group-directories-first'
alias lg='exa -la --group-directories-first --git'
alias piu='pip install --upgrade'
alias pipold='pip list --outdated'
alias diskuse='df --si | sort -hk3'


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
