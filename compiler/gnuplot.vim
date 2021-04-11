" Vim compiler file
" Language:		Gnuplot
" ----------------------------------------------------------------------------

if exists("current_compiler")
  finish
endif
let current_compiler = "gnuplot"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=gnuplot\ %:S

CompilerSet errorformat=
      \%E%p^,
      \%Z\"%f\"\\,\ line\ %l:\ %m,
      \\"%f\"\ line\ %l:\ %m,
      \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
