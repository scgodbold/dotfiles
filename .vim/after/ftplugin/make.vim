setlocal noexpandtab

if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= '|setlocal expandtab<'
else
    let b:undo_ftplugin = 'setlocal expandtab<'
endif
