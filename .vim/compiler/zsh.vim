if exists('current_compiler')
    finish
endif
let current_compiler = 'zsh'

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=zsh\ -n\ --\ %:S
CompilerSet errorformat=%f:%l:\ %m
