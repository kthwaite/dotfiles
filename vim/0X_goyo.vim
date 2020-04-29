" ==== Goyo ====================================================================
" We modify goyo to turn off our line-highlighting on entry.
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    set cursorline
    set showcmd
    set showmode
    set scrolloff=5
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
