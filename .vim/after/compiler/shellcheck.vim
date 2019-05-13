if exists('b:current_compiler')
    finish
endif
let b:current_compiler = 'pylama'

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=shellcheck\ --color=never\ --format=gcc\ --\ %:S
CompilerSet errorformat=%f:%l:%c:\ %m
