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
alias vi='nvim'
alias vim='nvim'

# -- pager
export PAGER='less'

# -- rust
export RUST_ROOT="$(rustc --print sysroot)"
export RUST_SRC_PATH="${RUST_ROOT}/lib/rustlib/src/rust/src/"

#==== Aliases ==================================================================
#
alias diskuse='df --si | sort -hk3'

# -- exa
# default
alias l="exa -alg --group-directories-first"
# as `l` but ordered by modified-time
alias lh='exa -la --group-directories-first -s modified'
# as `l` with git status
alias lg='exa -la --group-directories-first --git'
# list directory tree from cwd
alias dt="exa -algbT"
# as `dt` with git status
alias dtg="exa -algbT --git --git-ignore -I '.git'"
# -- ls
# invoke regular `ls`
alias ll="ls -alh"

# -- pip
alias piu='pip install --upgrade'
alias pipold='pip list --outdated'

# -- git-log
alias git-log-smp='git log --graph --pretty=oneline --abbrev-commit'
alias git-log-pty='git log --oneline --decorate --all --graph'
alias git-log-mn="git log --pretty=format:'• %C(bold yellow)%h%C(reset) %C(red)%an%C(reset) %C(blue)%ai%C(reset) %C(bold red)%D%C(reset) | %s'"

# -- java
alias what-javas='/usr/libexec/java_home -V'

#==== Functions ================================================================
#

# ---- text manipulation
#
linetrim() {
    sed -e :a -e '/./,$!d;/^\n*$/{$d;N;};/\n$/ba' $@
}

# ---- networking
# randomise MAC address
randmac() {
    local OLDMAC=$(ifconfig en0 | ag ether)
    local NEWMAC=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//g')
    echo "MAC address: ${OLDMAC}"
    echo "Changing MAC address to ${NEWMAC}..."
    sudo ifconfig en0 ether ${NEWMAC}
    ifconfig en0 | grep ether
}

# ---- version control
# update all git and/or hg repos in the current directory
pull-all() {
    for dir in */; do
        cd ${dir}
        echo "Checking ${dir}..."
        if [ -d ".git/" ]; then
            git pull
        elif [ -d ".hg/" ]; then
            hg pull && hg update
        else
            echo "    ${dir} is not a git or mercurial repo, skipping..."
        fi
        cd ..
    done
}

# list all git and hg repos in the current directory, prefixed by 'hg' or 'git'
list-repos() {
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

repo-url() {
    cat .git/config | sed '/url/q;d' | sed 's/	url = //;'
}

# ---- ffmpeg
# concatenate WMV files
wmvconcat() {
    local new_file
    if [ -z "$2" ]; then
        new_file="$1";
    else
        new_file="$2";
    fi
    ls "$1" * | while read line; do echo file \'$line\'; done | ffmpeg -f concat -i - -c copy "$new_file".wmv
}

# ---- node.js
npm-exec() {
   $(npm bin)/$@
}

# ---- misc
gdrivewget() {
    readonly local ID=${1}
    readonly local OUT=${0}
    wget --no-check-certificate -r "https://docs.google.com/uc?export=download&id=${ID}" -O ${OUT}
}
