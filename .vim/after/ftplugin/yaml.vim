setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= '|setlocal tabstop< shiftwidth< softtabstop<'
else
    let b:undo_ftplugin = '|setlocal tabstop< shiftwidth< softtabstop<'
endif
