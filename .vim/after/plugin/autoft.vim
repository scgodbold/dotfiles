if exists('g:loaded_autoft')
    finish
endif

if !has('autocmd') || &compatible
    finish
endif

if did_filetype()
    finish
endif


function! s:CheckShebang()
    if line('''[') == 1 && getline(1) =~# '^#!'
        doautocmd filetypedetect BufRead
    endif
endfunction

if v:version > 700
    augroup autoft
        autocmd InsertLeave * call s:CheckShebang()
    augroup END
endif
