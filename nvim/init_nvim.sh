#!/usr/bin/env bash

set -o errexit
set -o nounset


main() {
    if ! [[ -x "$(command -v nvim)" ]]; then
        echo "nvim not found. Make sure nvim is in PATH"
        exit 255
    fi
    mkdir -p $HOME/.config/nvim
    ln -s $HOME/.dotfiles/nvim/init.lua $HOME/.config/nvim
    ln -s $HOME/.dotfiles/nvim/lua $HOME/.config/nvim
}

main "$@"
