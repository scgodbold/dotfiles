" --------------------------------------------
" 1. Plugin Settings
" --------------------------------------------
set nocompatible				    " Make this thing uncompatiable with vi because this is vim goddamnit
filetype off					    " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim/	" add vundle to run time path
call vundle#rc()    				" required by vundle

Plugin 'gmarik/Vundle.vim'			" vundle managing vundle for all the meta
Plugin 'w0ng/vim-hybrid'			" Hybrid color scheme for the pretty
Plugin 'kien/ctrlp.vim'             " Ctrl-p for the file opening

call vundle#end()   				" end vundle managed plugins

" --------------------------------------------
" 2. Colors
" --------------------------------------------
set background=dark		" All about the dark terminals
set t_Co=256			" And 256 bit color schemes
syntax enable			" Enable Syntax Highlighting
colorscheme hybrid

" --------------------------------------------
" 3. Spaces & Tabs
" --------------------------------------------
set tabstop=4			" 4 spaces == 1 tab
set softtabstop=4		" number of spaces added/removed while editing
set shiftwidth=4		" Sets spaces shifted when using [<<] or [>>]
set expandtab			" Tabs are now spaces pahhh
set smarttab            " Smart tab handling for indenting
set smartindent         " ^ See above


" --------------------------------------------
" 4. UI Config
" --------------------------------------------
set number			" show line numbers
set scrolloff=5     " keep 5 lines from the edge of the screen
set cursorline      " horizontal line showing me where I am cause I am stupid
set showcmd         " show the commands you are giving in the bottom right
filetype indent on  " Filetype specific indenting
set lazyredraw      " speed up the macros????
set showmatch       " highlights matching pairs of: [{()}]

" --------------------------------------------
" 5. Searching
" --------------------------------------------
set incsearch       " search as characters get entered
set hlsearch        " highlight matches
set ignorecase      " case insensitive searching
set smartcase       " unless we want case

" Unhighlight the bits if we be done
nnoremap <leader><space> :nohlsearch<CR>

" --------------------------------------------
" 6. Folding
" --------------------------------------------
set foldenable          " I want to fold
set foldlevelstart=5    " Show most of the folds to begin with
set foldlevel=99        " Gimme all dem folds
set foldmethod=indent   " Fold on indent levels

" Make folding and unfolding easier w/ space
nnoremap <space> za

" --------------------------------------------
" 7. Movement
" --------------------------------------------
" move visually vertically not by line
nnoremap j gj
nnoremap k gk

" Making going to the start and of the line easier
nnoremap B ^
nnoremap E $

" And get ride of old bindings to break habbits
nnoremap $ <nop>
nnoremap ^ <nop>

" Highlight last inserted text
nnoremap gV `[v`]

" --------------------------------------------
" 8. Leader & Misc
" --------------------------------------------
let mapleader=','

" And jk/kj escapes insert mode
inoremap jk <esc>
inoremap kj <esc>

" Break that habbit right meow
inoremap <esc> <nop>


" remaping : to ; and save all the keystrokes
nnoremap ; :

" Edit the vimrc, and zshrc from anywhere, also source em
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" --------------------------------------------
" 9. Custom Functions
" --------------------------------------------
" Switches between relative and absolute numbering
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Give that a key binding (Tab twice)
nnoremap <tab><tab> :call ToggleNumber()<CR>

" --------------------------------------------
" 10. Autogroups
" --------------------------------------------
" 4 space tabs for python scripts
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal shiftwidth=4

" 2 space tabs for shell scripts
autocmd BufEnter *.sh setlocal tabstop=2
autocmd BufEnter *.sh setlocal shiftwidth=2
autocmd BufEnter *.sh setlocal softtabstop=2
