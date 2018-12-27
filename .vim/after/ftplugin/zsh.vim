compiler zsh

if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= '|unlet current_compiler'
        \ . '|setlocal errorformat< makeprg<'
else
    let b:undo_ftplugin = 'unlet current_compiler'
        \ . '|setlocal errorformat< makeprg<'
endif

if get(g:, 'autocheck_onwrite', 0)
    augroup zshlint
        autocmd BufWritePre <buffer> Dispatch
    augroup END
    let b:undo_ftplugin .= '|augroup! zshlint'
endif
