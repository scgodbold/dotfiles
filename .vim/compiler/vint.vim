if exists('b:current_compiler')
  finish
endif
let b:current_compiler = 'vint'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=vint\ --\ %:S
CompilerSet errorformat=%f:%l:%c:\ %m
