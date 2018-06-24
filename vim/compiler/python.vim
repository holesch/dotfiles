if exists("current_compiler")
  finish
endif
let current_compiler = "python"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:errorformat = [
            \'%*\sFile "%f", line %l, %m',
            \'%*\sFile "%f", line %l',
            \]

call map(s:errorformat, {i, v -> escape(v, ',')})
execute 'CompilerSet errorformat=' .
    \ escape(join(s:errorformat, ','), ' "|\')

CompilerSet makeprg=python3\ %
