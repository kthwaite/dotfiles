alias yumfzf="yum list --cacheonly | grep -Eo '^[^ ]+' | fzf -m --preview 'yum info {1}'"
