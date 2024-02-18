#!/usr/bin/env bash
# Symlink dotfiles into ~/

set -o errexit
set -o nounset

readonly symlinkable=(gitignore_global pylintrc tmux.conf)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

DRY_RUN=false
FORCE=false


# Symlink file.
function make_link {
    local -r src=${1}
    local -r dst=${2}
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
    local -r src=${1}
    local -r dst=${2}

    if [[ -e ${dst} ]]
    then
        printf " \033[0;31mFile already exists:\033[0m ${dst}\n"
    else
        echo " Would link: ${src} -> ${dst}"
    fi
}

function print_help {
    echo "Usage: link.sh [OPTIONS]"
    echo
    echo "    -d/--dry-run    Check and print links, but do not create"
    echo "    -f/--force      Overwrite existing files or symlinks"
    echo "    -v/--verbose    Print tracing output"
    echo "    -h/--help       Print this help text"
}

function main {
    while [[ $# -gt 0 ]]
    do
        key=$1

        case ${key} in
            -d|--dry-run)
                DRY_RUN=true
                ;;
            -f|--force)
                FORCE=true
                ;;
            -v|--verbose)
                set -o xtrace
                ;;
            -h|--help)
                print_help
                exit
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

main $@
