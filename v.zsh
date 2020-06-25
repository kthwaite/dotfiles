# tiny virtualenv manager
export V_VIRTUALENV_HOME="${HOME}/.virtualenvs"

function v_virtualenv_list_raw {
    find $V_VIRTUALENV_HOME -path "*/bin/python" | sed -r -e "s@${V_VIRTUALENV_HOME}/(.*)/bin/python@\1@g"| sort
}

function v_virtualenv_list {
    for python in $(find $V_VIRTUALENV_HOME -path "*/bin/python" | sort); do
        local NAME=$(echo $python | sed -r -e "s@${V_VIRTUALENV_HOME}/(.*)/bin/python@\1@g")
        local VER=$($python -c 'import sys;print(sys.version.split()[0],end="")')
        echo "${NAME} (${VER})"
    done
}

function v_virtualenv_switch {
    local -r V_ENV=$1
    local -r V_ACTIVATE="${V_VIRTUALENV_HOME}/${V_ENV}/bin/activate"
    if [ ! -f "${V_ACTIVATE}" ]; then
        echo "No such virtual environment: '${V_ENV}'"
        return 127
    fi
    if [[ -v VIRTUAL_ENV ]]; then
        deactivate
    fi
    source ${V_ACTIVATE}
}

function v {
    if [[ $# -eq 0 ]]; then
        if [[ -v VIRTUAL_ENV ]]; then
            deactivate
        else
            v_virtualenv_list
        fi
        return
    fi

    case "$1" in
        -l|--list)
            shift
            v_virtualenv_list $@
            ;;
        *)
            v_virtualenv_switch $1
            ;;
    esac
}


function v_install_completion {
    _v_virtualenv_list () {
        reply=( $(v_virtualenv_list_raw) )
    }
    compctl -K _v_virtualenv_list v
}

v_install_completion
