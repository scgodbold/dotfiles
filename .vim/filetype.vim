if exists('g:did_load_filetypes')
    finish
endif
let g:did_load_filetypes = 1

if !has('autocmd') || &compatible
    finish
endif

augroup filetypedectect
    autocmd BufNewFile,BufRead
        \ ?*.py
        \ setfiletype python

    autocmd BufNewFile,BufRead
        \ ?*.rb
        \ setfiletype ruby

    autocmd BufNewFile,BufRead
        \ ?*.yaml,
        \,?*.yml,
        \ setfiletype yaml

    autocmd BufNewFile,BufRead
        \ ?*.zsh,
        \,.zprofile
        \,.zshrc
        \,zprofile
        \,zshrc
        \ setfiletype zsh

    autocmd BufNewFile,BufRead
        \ ?*.vim
        \,*.vimrc,
        \,*.gvimrc,
        \,vimrc,
        \,gvimrc,
        \,.vimrc
        \ setfiletype vim

    autocmd BufNewFile,BufRead
        \ .tmux.conf
        \,tmux.conf
        \ setfiletype tmux

    autocmd BufNewFile,BufRead
        \ Makefile
        \,makefile
        \ setfiletype make

    autocmd BufNewFile,BufRead
        \ ?*.markdown,
        \,?*.md
        \ setfiletype markdown

    autocmd BufNewFile,BufRead
        \ ?*.json
        \ setfiletype json

    autocmd BufNewFile,BufRead
        \ COMMIT_EDITMSG
        \,MERGE_MSG
        \,TAG_EDIT_MSG
        \ setfiletype gitcommit

    autocmd BufNewFile,BufRead
        \ *.git/config
        \,.gitconfig
        \,.gitmodules
        \,gitconfig
        \ setfiletype gitconfig

    autocmd BufNewFIle,BufRead
        \ ?*.go
        \ setfiletype go
augroup END
