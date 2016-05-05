" Vimrc for Scott Godbold's work enviroment
" Last Update: May 5, 2016
" Installation Requirements:
"   flake8  (Through pip)
"   pylint  (Through pip)
"   tmux    (Through however you like)
"   vundle  (https://github.com/VundleVim/Vundle.vim)
" Also make sure the following directories exist
"   ~/.vim
"       |
"       |- .backup
"       |- .undo
"       |- .swap
"
" Important Notes:
"   Make sure all bindings involving <leader> go in the Leader Bindings section
"   Failure to do so will mean the binding will not work as it will be before
"   the leader was even declared

" -----------------------------------------------------------------------

" Table of Contents                                            *contents*

"   01. Plugin Settings ................................. |plugin_config|
"   02. Colors ........................................... |color_scheme|
"   03. Tabs and Spaces ................................... |tabs_spaces|
"   04. UI Configuration .................................... |ui_config|
"   05. Searching ....................................... |search_config|
"   06. Folding ........................................ |folding_config|
"   07. Key Bindings ........................................ |key_binds|
"   08. Leader Bindings .................................. |leader_binds|
"   09. Custom Functions ................................. |custom_funcs|
"   10. Autogroups ................................... |autogroup_config|
"   11. Syntastic Settings ........................... |syntastic_config|
"   12. Backups & Undos ................................. |backups_undos|


" -----------------------------------------------------------------------
" 01. Plugin Settings                                     *plugin_config*
" -----------------------------------------------------------------------
set nocompatible				            " Make this thing uncompatiable with vi because this is vim goddamnit
filetype off					            " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim/	        " add vundle to run time path
call vundle#rc()    				        " required by vundle

Plugin 'gmarik/vundle.vim'                  " vundle managing vundle for all the meta
Plugin 'w0ng/vim-hybrid'                    " hybrid color scheme for the pretty
Plugin 'scrooloose/syntastic'               " all the syntax checking
Plugin 'itchyny/lightline.vim'              " A lighter status line than airline
Plugin 'christoomey/vim-tmux-navigator'     " Make vim and tmux play together
Plugin 'ctrlpvim/ctrlp.vim'                 " Ctrl-p for the file openings
Plugin 'nathanaelkane/vim-indent-guides'    " This should help me view the indent levels
Plugin 'tweekmonster/braceless.vim'         " Braceless vim for better python folding & movement

call vundle#end()   				        " end vundle managed plugins

" -----------------------------------------------------------------------
" 02. Colors                                               *color_scheme*
" -----------------------------------------------------------------------
set background=dark		" All about the dark terminals
set t_Co=256			" And 256 bit color schemes
syntax enable			" Enable Syntax Highlighting
colorscheme hybrid      " our colorscheme definition

" This sets opacity to match the terminal settings
hi Normal ctermbg=none  
hi NonText ctermbg=none

" Set lightline colorscheme
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }

" -----------------------------------------------------------------------
" 03. Tabs & Spaces                                         *tabs_spaces*
" -----------------------------------------------------------------------
set tabstop=4			" 4 spaces == 1 tab
set softtabstop=4		" number of spaces added/removed while editing
set shiftwidth=4		" Sets spaces shifted when using [<<] or [>>]
set expandtab			" Tabs are now spaces pahhh
set smarttab            " Smart tab handling for indenting
set smartindent         " ^ See above

" Vim Indent Guides, useful for python and stuff
let g:indent_guides_auto_colors = 0                             " No Auto Color Detection
let g:indent_guides_guide_size = 1                              " Thin guides
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=238  " Declare custom even line color
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240 " Declare custom odd line color
let g:indent_guides_enable_on_vim_startup = 1                   " Lets have this on by default, <leader>ig to disable

" Strip away trailing whitespace from python files
autocmd BufWritePre *.py :%s/\s\+$//e

" -----------------------------------------------------------------------
" 04. UI Configuration                                        *ui_config*
" -----------------------------------------------------------------------
set number			                " show line numbers
set scrolloff=5                     " keep 5 lines from the edge of the screen
set cursorline                      " horizontal line showing me where I am cause I am stupid
set showcmd                         " show the commands you are giving in the bottom right
filetype indent on                  " Filetype specific indenting
" set lazyredraw                      " speed up the macros????
set showmatch                       " highlights matching pairs of: [{()}]
set splitright                      " vert splits open to the right
set splitbelow                      " horizontal splits open below
set laststatus=2                    " Make our lightline visible always

let g:airline_powerline_fonts = 0   " No Powerline font, till I get it working  

" -----------------------------------------------------------------------
" 05. Searching                                           *search_config*
" -----------------------------------------------------------------------
set incsearch                       " search as characters get entered
set hlsearch                        " highlight matches
set ignorecase                      " case insensitive searching
set smartcase                       " unless we want case

" Ctrl-p settings
set wildignore+=*.pyc,.git/*,*.swp  " Custom ignore files
let g:ctrlp_use_caching=0           " Disable caching

" Ignore files in gitignore and use silver searcher if able
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>'],
    \ }
endif

" -----------------------------------------------------------------------
" 06. Folding                                            *folding_config*
" -----------------------------------------------------------------------
set foldenable          " I want to fold
set foldlevelstart=5    " Show most of the folds to begin with
set foldlevel=99        " Gimme all dem folds
set foldmethod=indent   " Fold on indent levels

" Braceless for maybe even better folding & indententing
autocmd FileType python BracelessEnable +indent +fold


" -----------------------------------------------------------------------
" 07. Key Bindings                                            *key_binds*
" -----------------------------------------------------------------------
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

" And jk/kj escapes insert mode
inoremap jk <esc>
inoremap kj <esc>

" remaping : to ; and save all the keystrokes
nnoremap ; :

" Break that habbit right meow
inoremap <esc> <nop>

" -----------------------------------------------------------------------
" 08. Leader Bindings                                      *leader_binds*
" -----------------------------------------------------------------------
let mapleader=' '

" Edit the vimrc, and zshrc from anywhere, also source em
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Allow for <leader>\ and <leader>- to open vimsplits
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

" Unhighlight the bits if we be done
nnoremap <leader>c :nohlsearch<CR>

" Make folding and unfolding easier w/ space
nnoremap <leader>f za

" rebind control p keybings
nnoremap <leader>o :CtrlP<CR>

" -----------------------------------------------------------------------
" 09. Custom Functions                                     *custom_funcs*
" -----------------------------------------------------------------------
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

" zoom in on a specific window, then zoom back out
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed=0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed=1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
" bind it to <leader><leader>
nnoremap <silent> <leader><leader> :ZoomToggle<CR>

" -----------------------------------------------------------------------
" 10. Autogroups                                       *autogroup_config*
" -----------------------------------------------------------------------
" 4 space tabs for python scripts
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal shiftwidth=4

" 2 space tabs for shell scripts
autocmd BufEnter *.sh setlocal tabstop=2
autocmd BufEnter *.sh setlocal shiftwidth=2
autocmd BufEnter *.sh setlocal softtabstop=2

" -----------------------------------------------------------------------
" 11. Syntastic Settings                               *syntastic_config*
" -----------------------------------------------------------------------
set statusline+=%#warningmsg#                   " Syntastic Recommended
set statusline+=%{SyntasticStatuslineFlag()}    " Syntastic Recommended
set statusline+=%*                              " Syntastic Recommended

let g:syntastic_always_populate_loc_list = 1    " Syntastic Recommended
let g:syntastic_auto_loc_list = 1               " Syntastic Recommended
let g:syntastic_check_on_open = 1               " Syntastic Recommended
let g:syntastic_check_on_wq = 0                 " Syntastic Recommended

" Get ride of some annoying python errors I dont like/arent working (import errors, no-members) I am looking at you
let g:syntastic_python_pylint_quiet_messages = {'level': ['warning'], 'regex': ['import-error', 'no-member']}

" -----------------------------------------------------------------------
" 12. Backups & Undos                                     *backups_undos*
" -----------------------------------------------------------------------
set backupdir=~/.vim/.backup//  " We backup here now, instead if in dir
set undodir=~/.vim/.undo//      " And undo to here
set directory=~/.vim/.swap//     " This does things for swap files


set undofile                " persistent undo == $$$$
let undolevels=500          " undo all the things
let undoreload=500          " and the reload
