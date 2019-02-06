compiler shellcheck

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= '|unlet b:current_compiler'
        \ . '|setlocal errorformat< makeprg< tabstop< shiftwidth< softtabstop<'
else
    let b:undo_ftplugin = '|unlet b:current_compiler'
        \ . '|setlocal errorformat< makeprg< tabstop< shiftwidth< softtabstop<'
endif

if get(g:, 'autocheck_onwrite', 0)
    augroup shellchecker
        autocmd BufWritePre <buffer> Dispatch
    augroup END
    let b:undo_ftplugin .= '|augroup! shellchecker'
endif
