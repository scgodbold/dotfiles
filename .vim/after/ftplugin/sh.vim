compiler shellcheck

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= '|setlocal tabstop< shiftwidth< softtabstop<'
        \ . '|unlet b:current_compiler'
else
    let b:undo_ftplugin = 'setlocal tabstop< shiftwidth< softtabstop<'
        \ . '|unlet b:current_compiler'
endif

if get(g:, 'autocheck_onwrite', 0)
    augroup shellchecker
        autocmd BufWritePre <buffer> Dispatch
    augroup END
    let b:undo_ftplugin .= '|augroup! shellchecker'
endif
