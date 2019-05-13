if exists('b:current_compiler')
  finish
endif
let b:current_compiler = 'pylama'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pylama\ --format\ pylint\ -i\ E501\ --\ %:S
CompilerSet errorformat=%A%f:%l:%c:%t:\ %m,%A%f:%l:\ %m,%A%f:(%l):\ %m,%-Z%p^%.%#,%-G%.%#
