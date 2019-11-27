#!/usr/bin/env bash

set -o errexit
set -o nounset


main() {
    if ! [[ -x "$(command -v nvim)" ]]; then
        echo "nvim not found. Make sure nvim is in PATH"
        exit 255
    fi
    nvim --headless -c "call mkdir(stdpath('config'), 'p')|exe 'edit '.stdpath('config').'/init.vim'|wq"
    cat <<EOT >> $HOME/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT
}

main $@
