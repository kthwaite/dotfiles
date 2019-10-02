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

# -- zsh
# detach all other tmux sessions
alias takeover='tmux detach -a'

