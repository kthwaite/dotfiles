#!/usr/bin/env bash
# Symlink dotfiles into ~/

set -o errexit
set -o nounset

readonly symlinkable=(gitignore_global pylintrc tmux.conf vimrc)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

DRY_RUN=false
FORCE=false


# Symlink file.
function make_link {
    local readonly src=${1}
    local readonly dst=${2}
    echo "${src} -> ${dst}"
    if ! [[ -e ${dst} ]] || [[ ${FORCE} = true ]]
    then
        echo "Linking ${src} -> ${dst}"
        ln -s -F ${src} ${dst}
    else
        echo "    Skipping ${dst}, file already exists (-f/--force to overwrite)."
    fi
}

# Dry-run symlink.
function make_link_dry {
    local readonly src=${1}
    local readonly dst=${2}
    echo "${src} -> ${dst}\c"

    if [[ -e ${dst} ]]
    then
        printf " \033[0;31m(file already exists!)\033[0m\n"
    else
        echo
    fi

}

function main {
    while [[ $# -gt 0 ]]
    do
        key=$1

        case ${key} in
            -d|--dry-run)
                DRY_RUN=true
                ;;
        esac
        case ${key} in
            -f|--force)
                FORCE=true
                ;;
        esac
        case ${key} in
            -v|--verbose)
                set -o xtrace
                ;;
        esac
        shift
    done

    for source_file in ${symlinkable[@]}
    do
        local dst_path="${HOME}/.${source_file}"
        local src_path="${DIR}/${source_file}"
        if [[ ${DRY_RUN} = true ]]
        then
            make_link_dry ${src_path} ${dst_path}
        else
            make_link ${src_path} ${dst_path}
        fi
    done
}
