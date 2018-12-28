if exists ('b:did_indent')
    finish
endif

let b:did_indent = 1

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

let b:undo_indent = 'setlocal tabstop< shiftwidth< softtabstop<'
