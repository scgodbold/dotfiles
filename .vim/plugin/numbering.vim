if exists('g:loaded_numbering')
    finish
endif
let g:loaded_numbering = 1

function s:SwitchNumbers() abort
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

if !exists('g:numbering_map_keys')
    let g:zoom_map_keys = 1
endif

if g:zoom_map_keys
    nnoremap <tab><tab> :call <SID>SwitchNumbers()<cr>
endif
