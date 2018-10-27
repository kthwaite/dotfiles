#!/usr/bin/env bash
# Symlink dotfiles into ~/

set -o errexit
set -o nounset

readonly symlinkable=(gitignore_global pylintrc tmux.conf vimrc)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

while [[ $# -gt 0 ]]
do
  key=$1

  case ${key} in
    -d|--dry-run)
    DRY_RUN=true
    shift
    ;;
  esac
  case ${key} in
    -f|--force)
    FORCE=true
    shift
    ;;
  esac
  case ${key} in
    -v|--verbose)
    set -o xtrace
    shift
    ;;
  esac
done

# Symlink file.
function make_link {
  local src=${1}
  local dst=${2}
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
  local src=${1}
  local dst=${2}
  echo "${src} -> ${dst}\c"

  if [[ -e ${dst} ]]
  then
    printf " \033[0;31m(file already exists!)\033[0m\n"
  else
    echo
  fi

}

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
