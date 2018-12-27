if &filetype !=# 'vim' || v:version < 700 || &compatible
    finish
endif

if bufname('%') !=# 'command-line'
    compiler vint
    let b:undo_ftplugin .= ' |unlet b:current_compiler'
        \ . '|setlocal errorformat< makeprg<'
endif

if get(g:, 'autocheck_onwrite', 0)
    augroup vimlint
        autocmd BufWritePre <buffer> Dispatch
    augroup END
    let b:undo_ftplugin .= '|augroup! vimlint'
endif
