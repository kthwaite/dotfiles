" ==== Startify ================================================================
let g:ascii = [
\ "          .;CCC CCCC`<CCC>' ,<CCCCCC>>''.;C>>'''`<CCCCCC><CCC;<C>',<CCC",
\ "        . <CCCC, <CC>;,.,;<CCCC>>''.;<>,,,. -CCCC;.``''.;<C>>''',<CCC>",
\ "       <C;,CCCCC>.`C>'''''''  --<>;.``''<<<C;.`<<<CCCCCC>,;;<CCCCCCCC>;,",
\ "     ,CCCCCCCCC>' . `<C>' .,,zc,`<CCCC, -;.``<<>;<CCCCCCCCCC>>''''''<>'",
\ "    .<CCCCC''' zc$$$ccccc$$$$$$$h,.`<<C> <CCC;,,.``<`'CC>' .;<CCCCCC-",
\ "     ,CCCC' ,c$$$$$$$$$$$$$$$$$$$$$$cc,.  `'<<CCCCCCCCC,,<C`<CCC>>'    .,.",
\ "    ;CCCC' J$$$$$$$$$$$$$$$$$$$$$$$$$$$$$. `<>;,.```<<<<<CCC CC,.,,,;CC>'",
\ " .;C><C> z$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$. .`'<<<>>;,, <CC CCCCCCCCCC,,.",
\ "<C' `>   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$c CC>>;;, <C> CC,`CC>>'`'CCCCC",
\ "' ;C>;> J$$$$$$$$$$$$$$$$$$$$$$$$$????????$$$.`C''''<><>', CC,.,;;C>'`<CCC",
\ "  <CCC  $$$$$$$$$$$$$$$$$$$$$P\"  .,ccccccc$$$$. ,CCC>;,;<C,.``'''  ,<> .,'",
\ " ,CCC .<$$$$$$$$$$$$$$$$$$$$\"  zJ$$$$$$$$$$$$$$c <CCCC`<CCCCCCCCC>,`CC'<'",
\ ",CCC ; J$$$$$$$$$$$$$$$$$$$$,c$$??C????\"\"???$$$$hc`'>' ;.``<CC>>><C C> C>",
\ "CC>>;C ?$$$$$???????$$$$$$$$$$$FJP\",c===\"   J$$$$$c ;, <CC> <C><\<> C>;CC;",
\ ">  >' . $$P\".,,zzcc, \"$$$$$$$$$;\" ,.    $\" J$$$$$$$ <C> CCC <C < > <C `CCC",
\ ";<CCCC .`$,J$$$PCCC>?<C$$$$$$$$L -??    ,c$$$$$$$$$c C',CC> <' C,,;>   `CC",
\ "CCCC>',C ?$$CCJ?\"\"'_`,`\"$$$$$$$$$c,=cccd$$$$$$$$$$$$ C <C>  ,; C <>     `C",
\ "CCCC;,> .`$$$\",==\"\"-.  c<$$$$$$$$$$JJJJC?$$$$$$$$$$$ < CC < CC C,`>      `",
\ "CCCCCC;<C,`$F' .    `,JC:<$$$$$$$$$$$$$$$$$$$$$$$$$$>` <>-C CC,`C,`,.",
\ "`<C>`'CCCC,`h.,..,,,c$3C>:3$$$$$$$$$$$$$$$$$$$$$$$$$$ < <,<><`C;.`, <> .",
\ "    <C`<CC> $$$$$$$$$$$CC;<$$$$$$$$$$$$$$$$$$$$$$$$$$r`<;CCCCCCC>.' <> C;,",
\ "  ;CCC. CC>-`$$$$$$$$$$$CC:$$$$$$$$$?$$$$$$$$$$$$$$$$$.`<'`<CCCC>',C' <CCC",
\ "  <CC',<>',;.?$$$$$$$$$$C>;$$$$$9???-<$$$$$$$$$$$$$$$$$c,`-.``---''.,CCC>>",
\ ",C'CCCC ;.`C> $$$$$$$$$$$>`$$$$$F<;,c$$$$$$$$$$$$$$$$$$$$L `C>>;;<CCCCCCCC",
\ "C> CC>C,`C,`> `?$$$$$$$$$h;` `\"'.<$$$$$$$$$$$$$$$$$$$$$$$P . CCCCC,.;;.`''",
\ "'  `C `C;CC,CC; \"$$$$$$$$$$$$$$$$<$$$$$$$$$$$$$$$$$$$$$$P' C,`CCCCCCCCCCCC",
\ "    `C,.``<CCCCC, ?$$$$$$$$$$$????\"\"'\"\"\"\" J$$$$$$$$$$$$\" ..`C,C>`<<<<>>''<",
\ "     `CCCC;.``<CC>.`$$$$$$$???     .,c=:c$$$$$$$$$$$$P',$'< CC'C;  <CCCC>;",
\ "       <CCCCC>, `CC, \"$$$$$hcc,\"?C????JJ$$$$$$$$$$$$\",J$$ C CC <C . ``'',.",
\ "          `C>`CC,`<CC, \"$$$$$$$$$$>;;??$$$$$$$$$$$P',$$$$ C CC> C,`C;. <CC",
\ "         .,CC,`<C,,CCC .`?$$$$$$$$JJ$$$$$$$$$$$$P\",J$$$$F.>,CC><CC CCC> <C",
\ "       ;C>'CCC>.`<'<CC $c, ?$$$$$$$$$$$$$$$$$$$\" c$$$$$$ <><C> <CC ``<C;.`",
\ "      ,CC> `CCCCCCCCC',$$$h.`?$$$$$$$$$$$$$$$\" z$$$$$$$F;CC>',<CC>,C>.`<C;",
\ "      <C> <>.`'''<>'  $$$$$$$c \"$$$$$$$$$??\".z$$$$$$$$$ `\".;<CCC> .`<C; CC",
\ "      CC <CCC <C'<Cr J$$$$$$$$$c,``''\"\"'.zc$$$$$$$$$$$F;;CCCCC>' ;C, <CCCC",
\ "     <CC C><C CC CCC $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ CCCC>' .c;`<C> C <C",
\]
let g:startify_custom_header = g:ascii
let g:startify_list_order = ['files', 'bookmarks', 'sessions']
let g:startify_files_number = 5

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
