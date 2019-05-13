if exists('g:loaded_zoom')
    finish
endif
let g:loaded_zoom = 1

function s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed=1
    endif
endfunction

if !exists('g:zoom_map_keys')
    let g:zoom_map_keys = 1
endif

if g:zoom_map_keys
    nnoremap <silent> <leader><leader> :call <SID>ZoomToggle()<cr>
endif
