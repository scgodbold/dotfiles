compiler shellcheck

if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= '|unlet b:current_compiler'
        \ . '|setlocal errorformat< makeprg<'
else
    let b:undo_ftplugin = '|unlet b:current_compiler'
        \ . '|setlocal errorformat< makeprg<'
endif

if get(g:, 'autocheck_onwrite', 0)
    augroup shellchecker
        autocmd BufWritePre <buffer> Dispatch
    augroup END
    let b:undo_ftplugin .= '|augroup! shellchecker'
endif
