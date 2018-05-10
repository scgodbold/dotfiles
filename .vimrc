" Config for vim
"
" Author: Scott Godbold
" Last Update: January 7, 2018
"
" Important Notes:
"   Make sure all bindings involving <leader> go in the Leader Bindings section
"   Failure to do so will mean the binding will not work as it will be before
"   the leader was even declared

" Changelog:
"
"   2018.1.7
"       * Switched to vimplug from vundle
"       * Autocreate directories on start that are required by vim
"       * Remove jk/kj hot mappings, caused issues
"

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

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
    silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.vim/plugged')    		" Define plugins

" Plug 'w0ng/vim-hybrid'                    " My fallback colorscheme, always a good choice
Plug 'alessandroyorba/sierra'               " Sierra colors, the new hotness
Plug 'scrooloose/syntastic'                 " all the syntax checking
Plug 'itchyny/lightline.vim'                " A lighter status line than airline
Plug 'christoomey/vim-tmux-navigator'       " Make vim and tmux play together
Plug 'ctrlpvim/ctrlp.vim'                   " Ctrl-p for the file openings
Plug 'nathanaelkane/vim-indent-guides'      " This should help me view the indent levels
Plug 'tweekmonster/braceless.vim'           " Braceless vim for better python folding & movement
Plug 'tpope/vim-fugitive'                   " Need git access from vim
Plug 'tpope/vim-vinegar'                    " File navigation
Plug 'tpope/vim-commentary'                 " File navigation
Plug 'hashivim/vim-terraform'               " Terraform formating
Plug 'fatih/vim-go'                         " Support go development
Plug 'pprovost/vim-ps1'                     " Support powershell when I have to use it

call plug#end()   				            " end vundle managed plugins

" -----------------------------------------------------------------------
" 02. Colors                                               *color_scheme*
" -----------------------------------------------------------------------
set background=dark		                " All about the dark terminals
set t_Co=256			                " And 256 bit color schemes
syntax enable			                " Enable Syntax Highlighting
silent! colorscheme sierra              " our colorscheme definition

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
set backspace=2         " Apparently this is needed for deleting new lines

" Vim Indent Guides, useful for python and stuff
let g:indent_guides_auto_colors = 0                             " No Auto Color Detection
let g:indent_guides_guide_size = 1                              " Thin guides
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=238  " Declare custom even line color
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240 " Declare custom odd line color
let g:indent_guides_enable_on_vim_startup = 1                   " Lets have this on by default, <leader>ig to disable

" Strip away trailing whitespace from all files
autocmd BufWritePre * :%s/\s\+$//e

" -----------------------------------------------------------------------
" 04. UI Configuration                                        *ui_config*
" -----------------------------------------------------------------------
set number			                " show line numbers
set scrolloff=5                     " keep 5 lines from the edge of the screen
set cursorline                      " horizontal line showing me where I am cause I am stupid
set showcmd                         " show the commands you are giving in the bottom right
filetype indent on                  " Filetype specific indenting
set lazyredraw                      " speed up the macros????
set showmatch                       " highlights matching pairs of: [{()}]
set splitright                      " vert splits open to the right
set splitbelow                      " horizontal splits open below
set laststatus=2                    " Make our lightline visible always

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
let g:ctrlp_work_path_mode='cr'     " Start by looking in cwd

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

autocmd BufEnter *.py.erb BracelessEnable +indent +fold


" -----------------------------------------------------------------------
" 07. Key Bindings                                            *key_binds*
" -----------------------------------------------------------------------
" move visually vertically not by line by default
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Making going to the start and of the line easier
nnoremap B ^
nnoremap E $

" And get ride of old bindings to break habbits
nnoremap $ <nop>
nnoremap ^ <nop>

" Highlight last inserted text
nnoremap gV `[v`]

" remaping : to ; and save all the keystrokes
nnoremap ; :

" Remove command window, I dont find it useful for my work flow
nnoremap q: :q

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

" I want a redraw keybinding
nnoremap <leader>r :redraw!<CR>

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

" 2 space tabs for yaml scripts
autocmd BufEnter *.yml setlocal tabstop=2
autocmd BufEnter *.yml setlocal shiftwidth=2
autocmd BufEnter *.yml setlocal softtabstop=2
autocmd BufEnter *.yaml setlocal tabstop=2
autocmd BufEnter *.yaml setlocal shiftwidth=2
autocmd BufEnter *.yaml setlocal softtabstop=2

" Python syntax for .py.erb
autocmd BufEnter *.sh.erb set syntax=sh

" Python syntax for .py.erb
autocmd BufEnter *.py.erb setlocal syntax=python

" Make requires tabs, so lets set that
autocmd FileType make setlocal noexpandtab

" Autoformat terrform files on save
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" -----------------------------------------------------------------------
" 11. Syntastic Settings                               *syntastic_config*
" -----------------------------------------------------------------------
set statusline+=%#warningmsg#                   " Syntastic Recommended
set statusline+=%{SyntasticStatuslineFlag()}    " Syntastic Recommended
set statusline+=%*                              " Syntastic Recommended

let g:syntastic_always_populate_loc_list = 1    " Syntastic Recommended
let g:syntastic_auto_loc_list = 1               " Syntastic Recommended
let g:syntastic_check_on_open = 0               " Syntastic Recommended
let g:syntastic_check_on_wq = 0                 " Syntastic Recommended
let g:syntastic_mode_map = { 'mode': 'passive'}  " Enable syntastic mode, going to be used for toggling

" Get ride of some annoying python errors I dont like/arent working (import errors, no-members) I am looking at you
let g:syntastic_python_pylint_quiet_messages = {'level': ['warning'], 'regex': ['import-error', 'no-member']}

" Give us the option to hide and show syntastic
function! ToggleSyntastic()
    if(g:syntastic_mode_map['mode'] == 'active')
        call SyntasticToggleMode()
    else
        call SyntasticToggleMode()
        call SyntasticCheck()
    endif
endfunction
nnoremap <leader>h :call ToggleSyntastic()<CR>

" -----------------------------------------------------------------------
" 12. Backups & Undos                                     *backups_undos*
" -----------------------------------------------------------------------
" Set the backup directory and ensure that it exists
if !isdirectory($HOME . "/.vim/.backup")
    call mkdir($HOME . "/.vim/.backup", "p")
endif
set backupdir=~/.vim/.backup//

" Set the undo directory and ensure that it exists
if !isdirectory($HOME . "/.vim/.undo")
    call mkdir($HOME . "/.vim/.undo", "p")
endif
set undodir=~/.vim/.undo//

" Set the swap directory and ensure that it exists
if !isdirectory($HOME . "/.vim/.swap")
    call mkdir($HOME . "/.vim/.swap", "p")
endif
set directory=~/.vim/.swap//


set undofile                " persistent undo == $$$$
let undolevels=500          " undo all the things
let undoreload=500          " and the reload
