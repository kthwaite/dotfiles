setopt PROMPT_SUBST
rprompt_git() {
    # inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local -r ret="%B%F{2}$(git branch --show-current 2>&1)%f%b"
        print "$ret"
    fi
}

prompt_path_part() {
    local -r current_dir="${PWD/#$HOME/~}"
    if [[ "$current_dir" == (#m)[/~] ]]; then
        print "$current_dir"
    else
        # `s:string:` splits on `string`
        # `@` applies this to elements of an array
        # `j:string:` joins them back together again, using `string` as a separator
        # M includes the matched portion in the result
        # :h takes the directory part of the path, dropping the last item
        # :t takes the last part of the path
        local -r part="${${${${(@j:/:M)${(@s:/:)current_dir}##.#?}:h}%/}//\%/%%}/${${current_dir:t}//\%/%%}"
        print "$part"
    fi
}

build_prompt() {
    if [[ -n $VIRTUAL_ENV ]]; then
        # prompt expansion, no newline
        print -Pn "$(basename $VIRTUAL_ENV) "
    fi
    PROMPT='%F{4}$(prompt_path_part) %B%F{2}»%f%b '

    # Set up non-zero return value display
    # Set up git branch display
    # ↑
    RPROMPT='%(?..%F{1}%Bx %b%?%f) $(rprompt_git)'
}

build_prompt
