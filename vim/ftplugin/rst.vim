" Copy of the original VIM 8.1 rst.vim, just without loading fold expression

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< fo< sw< sts< ts<"

setlocal comments=fb:.. commentstring=..\ %s
setlocal formatoptions+=tcroql

" reStructuredText standard recommends that tabs be expanded to 8 spaces
" The choice of 3-space indentation is to provide slightly better support for
" directives (..) and ordered lists (1.), although it can cause problems for
" many other cases.

setlocal shiftwidth=3 softtabstop=3 tabstop=8

let &cpo = s:cpo_save
unlet s:cpo_save
